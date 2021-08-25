Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4CCF3F72C6
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 12:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237411AbhHYKQu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 06:16:50 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:54171 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237163AbhHYKQt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 06:16:49 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id IpwvmL9uKhPtjIpwwmLke3; Wed, 25 Aug 2021 12:16:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1629886563; bh=lD8VFVIG8PDd5V88nCZUhtu/rkIpoU0hp2pqM/O90Hk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iDGT0avnlBNawEFuMKFHYFDGxqtXLfriU5xFNzdS3cobNFVBTJ9mFEHKAFQRdAfWE
         ea3XPv7zhEYIOUFFVbjXqO20PPpjP3G3RmgZasGFAL1OWa2oYq6mqBwIgIn/5SfYwG
         y7J4YL1u9Ru44C0DhWbMCwigIX23XvYO+DjZcXIpAcQnobK4gPuPKHJPi8BbeqwBhP
         EN2F9DLdLYW1vO4HFE+x5Lt4BsjTiegUlUkoCRL6/oEyIHsmht5oNexLXZIN3fTsWo
         7rjApIpK34LgCpeuToqirejaTI1vVGYUABs9ynCRlkMocuu5jkgyyNT6lJpiPNAez1
         o+U2AcHsjyGBw==
Subject: Re: [PATCH v2] media: vivid: add signal-free time for cec message
 xfer
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
Cc:     jaffe1@gmail.com
References: <20210825084104.8387-1-deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d5a1e372-9f86-02c4-3e11-958d453d481f@xs4all.nl>
Date:   Wed, 25 Aug 2021 12:16:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825084104.8387-1-deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJ5deUdJ2UFsv0xemo7qA+BGRbMuUT5SSrWV0KIA3qmTW/Hr2iZZBQ3JZZzMzvJs/xiW5GSB2lmoA6HpthyL/nTukYvuOJSECG2K6XUFkSLd6TNbCojy
 aHGdtttNfFxvZi7b8fPpczFe0sH2dx4IQMEn8TAxYsnkXsxKYni0UTc16QKF171OiVU7M8auJiefYOOrq8LqbNUycM2tXFbgvRRcHTsUyEm04WNQTFEnn7tJ
 IySo5OupuRK2ycD02OdbKuySRLJ4byOE9nUhz+yp5bdXKSy8w/IzsDqKFkYgzohUdoCFcJwT1xXwWm4CWYJr08s1BVYMIz/mMJ/VunQR5tmocSXAT/F/qFY1
 AsFCt9G5
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/08/2021 10:41, Deborah Brouwer wrote:
> Currently, the vivid emulation of cec message transmission does not force
> adapters to wait until the cec bus has been signal-free for a certain
> number of bit periods before transmitting or re-transmitting a message.
> Without enforcing the signal-free time requirements, adapters do not share
> the bus very well and some messages are sent too quickly while other
> messages are lost. By emulating a signal-free time and forcing adapters
> to wait their turn to transmit, the vivid emulation of cec transmission
> is much more reliable.
> 
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
> Changes since v1:
> - use actual message length instead of max when copying
> - check for kthread_stop() within bus
> - store the last_initiator in the vivid state
> - update the last_initiator as soon as it is known and adjust sfts
> - use last_initiator to assign sft when transmit is called
> - use function for division
> 
>  drivers/media/test-drivers/vivid/vivid-cec.c  | 341 ++++++++++--------
>  drivers/media/test-drivers/vivid/vivid-cec.h  |   9 +-
>  drivers/media/test-drivers/vivid/vivid-core.c |  37 +-
>  drivers/media/test-drivers/vivid/vivid-core.h |  23 +-
>  4 files changed, 218 insertions(+), 192 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-cec.c b/drivers/media/test-drivers/vivid/vivid-cec.c
> index 4d2413e87730..d97da4f10ad7 100644
> --- a/drivers/media/test-drivers/vivid/vivid-cec.c
> +++ b/drivers/media/test-drivers/vivid/vivid-cec.c
> @@ -5,40 +5,23 @@
>   * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>   */
>  
> +#include <linux/delay.h>
>  #include <media/cec.h>
>  
>  #include "vivid-core.h"
>  #include "vivid-cec.h"
>  
> -#define CEC_TIM_START_BIT_TOTAL		4500
> -#define CEC_TIM_START_BIT_LOW		3700
> -#define CEC_TIM_START_BIT_HIGH		800
> -#define CEC_TIM_DATA_BIT_TOTAL		2400
> -#define CEC_TIM_DATA_BIT_0_LOW		1500
> -#define CEC_TIM_DATA_BIT_0_HIGH		900
> -#define CEC_TIM_DATA_BIT_1_LOW		600
> -#define CEC_TIM_DATA_BIT_1_HIGH		1800
> +#define CEC_START_BIT_US		4500
> +#define CEC_DATA_BIT_US			2400
> +#define CEC_MARGIN_US			350
>  
> -void vivid_cec_bus_free_work(struct vivid_dev *dev)
> -{
> -	spin_lock(&dev->cec_slock);
> -	while (!list_empty(&dev->cec_work_list)) {
> -		struct vivid_cec_work *cw =
> -			list_first_entry(&dev->cec_work_list,
> -					 struct vivid_cec_work, list);
> -
> -		spin_unlock(&dev->cec_slock);
> -		cancel_delayed_work_sync(&cw->work);
> -		spin_lock(&dev->cec_slock);
> -		list_del(&cw->list);
> -		cec_transmit_attempt_done(cw->adap, CEC_TX_STATUS_LOW_DRIVE);
> -		kfree(cw);
> -	}
> -	spin_unlock(&dev->cec_slock);
> -}
> +struct xfer_on_bus {
> +	struct cec_adapter	*adap;
> +	u8			status;
> +};
>  
> -static bool vivid_cec_find_dest_adap(struct vivid_dev *dev,
> -				     struct cec_adapter *adap, u8 dest)
> +static bool find_dest_adap(struct vivid_dev *dev,
> +			   struct cec_adapter *adap, u8 dest)
>  {
>  	unsigned int i;
>  
> @@ -61,116 +44,187 @@ static bool vivid_cec_find_dest_adap(struct vivid_dev *dev,
>  	return false;
>  }
>  
> -static void vivid_cec_pin_adap_events(struct cec_adapter *adap, ktime_t ts,
> -				      const struct cec_msg *msg, bool nacked)
> +static bool xfer_ready(struct vivid_dev *dev)
>  {
> -	unsigned int len = nacked ? 1 : msg->len;
>  	unsigned int i;
> -	bool bit;
> -
> -	if (adap == NULL)
> -		return;
> +	bool ready = false;
>  
> -	/*
> -	 * Suffix ULL on constant 10 makes the expression
> -	 * CEC_TIM_START_BIT_TOTAL + 10ULL * len * CEC_TIM_DATA_BIT_TOTAL
> -	 * to be evaluated using 64-bit unsigned arithmetic (u64), which
> -	 * is what ktime_sub_us expects as second argument.
> -	 */
> -	ts = ktime_sub_us(ts, CEC_TIM_START_BIT_TOTAL +
> -			       10ULL * len * CEC_TIM_DATA_BIT_TOTAL);
> -	cec_queue_pin_cec_event(adap, false, false, ts);
> -	ts = ktime_add_us(ts, CEC_TIM_START_BIT_LOW);
> -	cec_queue_pin_cec_event(adap, true, false, ts);
> -	ts = ktime_add_us(ts, CEC_TIM_START_BIT_HIGH);
> -
> -	for (i = 0; i < 10 * len; i++) {
> -		switch (i % 10) {
> -		case 0 ... 7:
> -			bit = msg->msg[i / 10] & (0x80 >> (i % 10));
> -			break;
> -		case 8: /* EOM */
> -			bit = i / 10 == msg->len - 1;
> -			break;
> -		case 9: /* ACK */
> -			bit = cec_msg_is_broadcast(msg) ^ nacked;
> +	spin_lock(&dev->cec_xfers_slock);
> +	for (i = 0; i < ARRAY_SIZE(dev->xfers); i++) {
> +		if (dev->xfers[i].sft &&
> +		    dev->xfers[i].sft <= dev->cec_sft) {
> +			ready = true;
>  			break;
>  		}
> -		cec_queue_pin_cec_event(adap, false, false, ts);
> -		if (bit)
> -			ts = ktime_add_us(ts, CEC_TIM_DATA_BIT_1_LOW);
> -		else
> -			ts = ktime_add_us(ts, CEC_TIM_DATA_BIT_0_LOW);
> -		cec_queue_pin_cec_event(adap, true, false, ts);
> -		if (bit)
> -			ts = ktime_add_us(ts, CEC_TIM_DATA_BIT_1_HIGH);
> -		else
> -			ts = ktime_add_us(ts, CEC_TIM_DATA_BIT_0_HIGH);
>  	}
> -}
> +	spin_unlock(&dev->cec_xfers_slock);
>  
> -static void vivid_cec_pin_events(struct vivid_dev *dev,
> -				 const struct cec_msg *msg, bool nacked)
> -{
> -	ktime_t ts = ktime_get();
> -	unsigned int i;
> -
> -	vivid_cec_pin_adap_events(dev->cec_rx_adap, ts, msg, nacked);
> -	for (i = 0; i < MAX_OUTPUTS; i++)
> -		vivid_cec_pin_adap_events(dev->cec_tx_adap[i], ts, msg, nacked);
> +	return ready;
>  }
>  
> -static void vivid_cec_xfer_done_worker(struct work_struct *work)
> +/*
> + * If an adapter tries to send successive messages, it must wait for the
> + * longest signal-free time between its transmissions. But, if another
> + * adapter sends a message in the interim, then the wait can be reduced
> + * because the messages are no longer successive. Make these adjustments
> + * if necessary. Should be called holding cec_xfers_slock.
> + */
> +static void adjust_sfts(struct vivid_dev *dev)
>  {
> -	struct vivid_cec_work *cw =
> -		container_of(work, struct vivid_cec_work, work.work);
> -	struct vivid_dev *dev = cw->dev;
> -	struct cec_adapter *adap = cw->adap;
> -	u8 dest = cec_msg_destination(&cw->msg);
> -	bool valid_dest;
>  	unsigned int i;
> +	u8 initiator;
>  
> -	valid_dest = cec_msg_is_broadcast(&cw->msg);
> -	if (!valid_dest)
> -		valid_dest = vivid_cec_find_dest_adap(dev, adap, dest);
> -
> -	cw->tx_status = valid_dest ? CEC_TX_STATUS_OK : CEC_TX_STATUS_NACK;
> -	spin_lock(&dev->cec_slock);
> -	dev->cec_xfer_time_jiffies = 0;
> -	dev->cec_xfer_start_jiffies = 0;
> -	list_del(&cw->list);
> -	spin_unlock(&dev->cec_slock);
> -	vivid_cec_pin_events(dev, &cw->msg, !valid_dest);
> -	cec_transmit_attempt_done(cw->adap, cw->tx_status);
> -
> -	/* Broadcast message */
> -	if (adap != dev->cec_rx_adap)
> -		cec_received_msg(dev->cec_rx_adap, &cw->msg);
> -	for (i = 0; i < MAX_OUTPUTS && dev->cec_tx_adap[i]; i++)
> -		if (adap != dev->cec_tx_adap[i])
> -			cec_received_msg(dev->cec_tx_adap[i], &cw->msg);
> -	kfree(cw);
> +	for (i = 0; i < ARRAY_SIZE(dev->xfers); i++) {
> +		if (dev->xfers[i].sft <= CEC_SIGNAL_FREE_TIME_RETRY)
> +			continue;
> +		initiator = dev->xfers[i].msg[0] >> 4;
> +		if (initiator == dev->last_initiator)
> +			dev->xfers[i].sft = CEC_SIGNAL_FREE_TIME_NEXT_XFER;
> +		else
> +			dev->xfers[i].sft = CEC_SIGNAL_FREE_TIME_NEW_INITIATOR;
> +	}
>  }
>  
> -static void vivid_cec_xfer_try_worker(struct work_struct *work)
> +/*
> + * The main emulation of the bus on which CEC adapters attempt to send
> + * messages to each other. The bus keeps track of how long it has been
> + * signal-free and accepts a pending transmission only if the state of
> + * the bus matches the transmission's signal-free requirements. It calls
> + * cec_transmit_attempt_done() for all transmits that enter the bus and
> + * cec_received_msg() for successful transmits.
> + */
> +int vivid_cec_bus_thread(void *_dev)
>  {
> -	struct vivid_cec_work *cw =
> -		container_of(work, struct vivid_cec_work, work.work);
> -	struct vivid_dev *dev = cw->dev;
> -
> -	spin_lock(&dev->cec_slock);
> -	if (dev->cec_xfer_time_jiffies) {
> -		list_del(&cw->list);
> -		spin_unlock(&dev->cec_slock);
> -		cec_transmit_attempt_done(cw->adap, CEC_TX_STATUS_ARB_LOST);
> -		kfree(cw);
> -	} else {
> -		INIT_DELAYED_WORK(&cw->work, vivid_cec_xfer_done_worker);
> -		dev->cec_xfer_start_jiffies = jiffies;
> -		dev->cec_xfer_time_jiffies = usecs_to_jiffies(cw->usecs);
> -		spin_unlock(&dev->cec_slock);
> -		schedule_delayed_work(&cw->work, dev->cec_xfer_time_jiffies);
> +	u32 last_sft;
> +	unsigned int i;
> +	unsigned int dest;
> +	ktime_t start, end;
> +	s64 delta_us, retry_us;
> +	unsigned int first_idx;
> +	unsigned int first_status;
> +	struct vivid_dev *dev = _dev;
> +
> +	dev->cec_sft = CEC_SIGNAL_FREE_TIME_NEXT_XFER;
> +	for (;;) {
> +		bool first = true;
> +		int wait_xfer_us = 0;
> +		bool valid_dest = false;
> +		int wait_arb_lost_us = 0;
> +		struct cec_msg first_msg = {};
> +		struct xfer_on_bus xfers_on_bus[MAX_OUTPUTS] = {};
> +
> +		wait_event_interruptible(dev->kthread_waitq_cec, xfer_ready(dev) ||
> +					 kthread_should_stop());
> +		if (kthread_should_stop())
> +			break;
> +		last_sft = dev->cec_sft;
> +		dev->cec_sft = 0;
> +		/*
> +		 * Move the messages that are ready onto the bus. The adapter with
> +		 * the most leading zeros will win control of the bus and any other
> +		 * adapters will lose arbitration.
> +		 */
> +		spin_lock(&dev->cec_xfers_slock);
> +		for (i = 0; i < ARRAY_SIZE(dev->xfers); i++) {
> +			if (!dev->xfers[i].sft || dev->xfers[i].sft > last_sft)
> +				continue;
> +			if (first) {
> +				first = false;
> +				first_idx = i;
> +				xfers_on_bus[first_idx].adap = dev->xfers[i].adap;
> +				memcpy(first_msg.msg, dev->xfers[i].msg, dev->xfers[i].len);
> +				first_msg.len = dev->xfers[i].len;
> +			} else {
> +				xfers_on_bus[i].adap = dev->xfers[i].adap;
> +				xfers_on_bus[i].status = CEC_TX_STATUS_ARB_LOST;
> +				/*
> +				 * For simplicity wait for all 4 bits of the initiator's
> +				 * address even though HDMI specification uses bit-level
> +				 * precision.
> +				 */
> +				wait_arb_lost_us = 4 * CEC_DATA_BIT_US + CEC_START_BIT_US;
> +			}
> +			dev->xfers[i].sft = 0;
> +		}
> +		dev->last_initiator = cec_msg_initiator(&first_msg);
> +		adjust_sfts(dev);
> +		spin_unlock(&dev->cec_xfers_slock);
> +
> +		dest = cec_msg_destination(&first_msg);
> +		valid_dest = cec_msg_is_broadcast(&first_msg);
> +		if (!valid_dest)
> +			valid_dest = find_dest_adap(dev, xfers_on_bus[first_idx].adap, dest);
> +		if (valid_dest) {
> +			first_status = CEC_TX_STATUS_OK;
> +			/*
> +			 * Message length is in bytes, but each byte is transmitted in
> +			 * a block of 10 bits.
> +			 */
> +			wait_xfer_us = first_msg.len * 10 * CEC_DATA_BIT_US;
> +		} else {
> +			first_status = CEC_TX_STATUS_NACK;
> +			/*
> +			 * A message that is not acknowledged stops transmitting after
> +			 * the header block of 10 bits.
> +			 */
> +			wait_xfer_us = 10 * CEC_DATA_BIT_US;
> +		}
> +		wait_xfer_us += CEC_START_BIT_US;
> +		xfers_on_bus[first_idx].status = first_status;

I'm getting this compiler warning:

vivid-cec.c:190:3: warning: 'first_idx' may be used uninitialized in this function [-Wmaybe-uninitialized]

The compiler isn't quite smart enough to figure out that first_idx will always be
initialized, but it is still a good idea to just initialize first_idx to 0. I would
also move the first_idx and first_status variables into the for-loop as well, after
the 'bool first' variable.

> +
> +		/* Sleep as if sending messages on a real hardware bus. */
> +		start = ktime_get();
> +		if (wait_arb_lost_us) {
> +			usleep_range(wait_arb_lost_us - CEC_MARGIN_US, wait_arb_lost_us);
> +			for (i = 0; i < ARRAY_SIZE(xfers_on_bus); i++) {
> +				if (xfers_on_bus[i].status != CEC_TX_STATUS_ARB_LOST)
> +					continue;
> +				cec_transmit_attempt_done(xfers_on_bus[i].adap,
> +							  CEC_TX_STATUS_ARB_LOST);
> +			}
> +			if (kthread_should_stop())
> +				break;
> +		}
> +		wait_xfer_us -= wait_arb_lost_us;
> +		usleep_range(wait_xfer_us - CEC_MARGIN_US, wait_xfer_us);
> +		cec_transmit_attempt_done(xfers_on_bus[first_idx].adap, first_status);
> +		if (kthread_should_stop())
> +			break;
> +		if (first_status == CEC_TX_STATUS_OK) {
> +			if (xfers_on_bus[first_idx].adap != dev->cec_rx_adap)
> +				cec_received_msg(dev->cec_rx_adap, &first_msg);
> +			for (i = 0; i < MAX_OUTPUTS && dev->cec_tx_adap[i]; i++)
> +				if (xfers_on_bus[first_idx].adap != dev->cec_tx_adap[i])
> +					cec_received_msg(dev->cec_tx_adap[i], &first_msg);
> +		}
> +		end = ktime_get();
> +		/*
> +		 * If the emulated transfer took more or less time than it should
> +		 * have, then compensate by adjusting the wait time needed for the
> +		 * bus to be signal-free for 3 bit periods (the retry time).
> +		 */
> +		delta_us = div_s64(end - start, 1000);
> +		delta_us -= wait_xfer_us + wait_arb_lost_us;
> +		retry_us = CEC_SIGNAL_FREE_TIME_RETRY * CEC_DATA_BIT_US - delta_us;
> +		if (retry_us > CEC_MARGIN_US)
> +			usleep_range(retry_us - CEC_MARGIN_US, retry_us);
> +		dev->cec_sft = CEC_SIGNAL_FREE_TIME_RETRY;
> +		/*
> +		 * If there are no messages that need to be retried, check if any
> +		 * adapters that did not just transmit a message are ready to
> +		 * transmit. If none of these adapters are ready, then increase
> +		 * the signal-free time so that the bus is available to all
> +		 * adapters and go back to waiting for a transmission.
> +		 */
> +		while (dev->cec_sft >= CEC_SIGNAL_FREE_TIME_RETRY &&
> +		       dev->cec_sft < CEC_SIGNAL_FREE_TIME_NEXT_XFER &&
> +		       !xfer_ready(dev) && !kthread_should_stop()) {
> +			usleep_range(2 * CEC_DATA_BIT_US - CEC_MARGIN_US,
> +				     2 * CEC_DATA_BIT_US);
> +			dev->cec_sft += 2;
> +		}
>  	}
> +	return 0;
>  }
>  
>  static int vivid_cec_adap_enable(struct cec_adapter *adap, bool enable)
> @@ -184,41 +238,26 @@ static int vivid_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
>  	return 0;
>  }
>  
> -/*
> - * One data bit takes 2400 us, each byte needs 10 bits so that's 24000 us
> - * per byte.
> - */
> -#define USECS_PER_BYTE 24000
> -
>  static int vivid_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
>  				   u32 signal_free_time, struct cec_msg *msg)
>  {
>  	struct vivid_dev *dev = cec_get_drvdata(adap);
> -	struct vivid_cec_work *cw = kzalloc(sizeof(*cw), GFP_KERNEL);
> -	long delta_jiffies = 0;
> -
> -	if (cw == NULL)
> -		return -ENOMEM;
> -	cw->dev = dev;
> -	cw->adap = adap;
> -	cw->usecs = CEC_FREE_TIME_TO_USEC(signal_free_time) +
> -		    msg->len * USECS_PER_BYTE;
> -	cw->msg = *msg;
> -
> -	spin_lock(&dev->cec_slock);
> -	list_add(&cw->list, &dev->cec_work_list);
> -	if (dev->cec_xfer_time_jiffies == 0) {
> -		INIT_DELAYED_WORK(&cw->work, vivid_cec_xfer_done_worker);
> -		dev->cec_xfer_start_jiffies = jiffies;
> -		dev->cec_xfer_time_jiffies = usecs_to_jiffies(cw->usecs);
> -		delta_jiffies = dev->cec_xfer_time_jiffies;
> -	} else {
> -		INIT_DELAYED_WORK(&cw->work, vivid_cec_xfer_try_worker);
> -		delta_jiffies = dev->cec_xfer_start_jiffies +
> -			dev->cec_xfer_time_jiffies - jiffies;
> +	u8 idx = cec_msg_initiator(msg);
> +
> +	spin_lock(&dev->cec_xfers_slock);
> +	dev->xfers[idx].adap = adap;
> +	memcpy(dev->xfers[idx].msg, msg->msg, CEC_MAX_MSG_SIZE);
> +	dev->xfers[idx].len = msg->len;
> +	dev->xfers[idx].sft = CEC_SIGNAL_FREE_TIME_RETRY;
> +	if (signal_free_time > CEC_SIGNAL_FREE_TIME_RETRY) {
> +		if (idx == dev->last_initiator)
> +			dev->xfers[idx].sft = CEC_SIGNAL_FREE_TIME_NEXT_XFER;
> +		else
> +			dev->xfers[idx].sft = CEC_SIGNAL_FREE_TIME_NEW_INITIATOR;
>  	}
> -	spin_unlock(&dev->cec_slock);
> -	schedule_delayed_work(&cw->work, delta_jiffies < 0 ? 0 : delta_jiffies);
> +	spin_unlock(&dev->cec_xfers_slock);
> +	wake_up_interruptible(&dev->kthread_waitq_cec);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/media/test-drivers/vivid/vivid-cec.h b/drivers/media/test-drivers/vivid/vivid-cec.h
> index 7524ed48a914..b2bcddb50b83 100644
> --- a/drivers/media/test-drivers/vivid/vivid-cec.h
> +++ b/drivers/media/test-drivers/vivid/vivid-cec.h
> @@ -9,12 +9,5 @@
>  struct cec_adapter *vivid_cec_alloc_adap(struct vivid_dev *dev,
>  					 unsigned int idx,
>  					 bool is_source);
> -void vivid_cec_bus_free_work(struct vivid_dev *dev);
> -
> -#else
> -
> -static inline void vivid_cec_bus_free_work(struct vivid_dev *dev)
> -{
> -}
> -
> +int vivid_cec_bus_thread(void *_dev);
>  #endif
> diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
> index d2bd2653cf54..1973e08953ab 100644
> --- a/drivers/media/test-drivers/vivid/vivid-core.c
> +++ b/drivers/media/test-drivers/vivid/vivid-core.c
> @@ -1878,18 +1878,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	INIT_LIST_HEAD(&dev->meta_out_active);
>  	INIT_LIST_HEAD(&dev->touch_cap_active);
>  
> -	INIT_LIST_HEAD(&dev->cec_work_list);
> -	spin_lock_init(&dev->cec_slock);
> -	/*
> -	 * Same as create_singlethread_workqueue, but now I can use the
> -	 * string formatting of alloc_ordered_workqueue.
> -	 */
> -	dev->cec_workqueue = alloc_ordered_workqueue("vivid-%03d-cec",
> -						     WQ_MEM_RECLAIM, inst);
> -	if (!dev->cec_workqueue) {
> -		ret = -ENOMEM;
> -		goto unreg_dev;
> -	}
> +	spin_lock_init(&dev->cec_xfers_slock);
>  
>  	if (allocators[inst] == 1)
>  		dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> @@ -1929,6 +1918,18 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  			cec_tx_bus_cnt++;
>  		}
>  	}
> +
> +	if (dev->cec_rx_adap || cec_tx_bus_cnt) {
> +		init_waitqueue_head(&dev->kthread_waitq_cec);
> +		dev->kthread_cec = kthread_run(vivid_cec_bus_thread, dev,
> +					       "vivid_cec-%s", dev->v4l2_dev.name);
> +		if (IS_ERR(dev->kthread_cec)) {
> +			dev->kthread_cec = NULL;
> +			v4l2_err(&dev->v4l2_dev, "kernel_thread() failed\n");

You should this line here:

			ret = PTR_ERR(dev->kthread_cec);

to correctly propagate the kthread_run error code.

Regards,

	Hans

> +			goto unreg_dev;
> +		}
> +	}
> +
>  #endif
>  
>  	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_cap);
> @@ -1968,10 +1969,8 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	cec_unregister_adapter(dev->cec_rx_adap);
>  	for (i = 0; i < MAX_OUTPUTS; i++)
>  		cec_unregister_adapter(dev->cec_tx_adap[i]);
> -	if (dev->cec_workqueue) {
> -		vivid_cec_bus_free_work(dev);
> -		destroy_workqueue(dev->cec_workqueue);
> -	}
> +	if (dev->kthread_cec)
> +		kthread_stop(dev->kthread_cec);
>  free_dev:
>  	v4l2_device_put(&dev->v4l2_dev);
>  	return ret;
> @@ -2093,10 +2092,8 @@ static int vivid_remove(struct platform_device *pdev)
>  		cec_unregister_adapter(dev->cec_rx_adap);
>  		for (j = 0; j < MAX_OUTPUTS; j++)
>  			cec_unregister_adapter(dev->cec_tx_adap[j]);
> -		if (dev->cec_workqueue) {
> -			vivid_cec_bus_free_work(dev);
> -			destroy_workqueue(dev->cec_workqueue);
> -		}
> +		if (dev->kthread_cec)
> +			kthread_stop(dev->kthread_cec);
>  		v4l2_device_put(&dev->v4l2_dev);
>  		vivid_devs[i] = NULL;
>  	}
> diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
> index 1e3c4f5a9413..45f96706edde 100644
> --- a/drivers/media/test-drivers/vivid/vivid-core.h
> +++ b/drivers/media/test-drivers/vivid/vivid-core.h
> @@ -110,15 +110,11 @@ enum vivid_colorspace {
>  #define VIVID_INVALID_SIGNAL(mode) \
>  	((mode) == NO_SIGNAL || (mode) == NO_LOCK || (mode) == OUT_OF_RANGE)
>  
> -struct vivid_cec_work {
> -	struct list_head	list;
> -	struct delayed_work	work;
> +struct vivid_cec_xfer {
>  	struct cec_adapter	*adap;
> -	struct vivid_dev	*dev;
> -	unsigned int		usecs;
> -	unsigned int		timeout_ms;
> -	u8			tx_status;
> -	struct cec_msg		msg;
> +	u8			msg[CEC_MAX_MSG_SIZE];
> +	u32			len;
> +	u32			sft;
>  };
>  
>  struct vivid_dev {
> @@ -560,12 +556,13 @@ struct vivid_dev {
>  	/* CEC */
>  	struct cec_adapter		*cec_rx_adap;
>  	struct cec_adapter		*cec_tx_adap[MAX_OUTPUTS];
> -	struct workqueue_struct		*cec_workqueue;
> -	spinlock_t			cec_slock;
> -	struct list_head		cec_work_list;
> -	unsigned int			cec_xfer_time_jiffies;
> -	unsigned long			cec_xfer_start_jiffies;
>  	u8				cec_output2bus_map[MAX_OUTPUTS];
> +	struct task_struct		*kthread_cec;
> +	wait_queue_head_t		kthread_waitq_cec;
> +	struct vivid_cec_xfer	xfers[MAX_OUTPUTS];
> +	spinlock_t			cec_xfers_slock; /* read and write cec messages */
> +	u32				cec_sft; /* bus signal free time, in bit periods */
> +	u8				last_initiator;
>  
>  	/* CEC OSD String */
>  	char				osd[14];
> 

