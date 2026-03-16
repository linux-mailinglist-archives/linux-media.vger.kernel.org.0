Return-Path: <linux-media+bounces-55935-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INa+IrcYuGn/YwEAu9opvQ
	(envelope-from <linux-media+bounces-55935-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:50:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E003429BB41
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82CE2302DF5B
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DEF2EC0B4;
	Mon, 16 Mar 2026 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=r-sc.ca header.i=@r-sc.ca header.b="X7ydc0pC"
X-Original-To: linux-media@vger.kernel.org
Received: from out-21.smtp.spacemail.com (out-21.smtp.spacemail.com [66.29.159.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB89C9460
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.29.159.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672603; cv=none; b=TgLLsRW5MFzKwZm//RaD18ljgEVD/0pwJA5MtVjpo1ot3UqUNySR1UE6m9qf+y995+SToCbAwum/8er4SKSAr3ai3T80r8fp/PcQgGnIi11qv0/kS9onqo+iJBMgnRmWzh2/jn0maWPYZzuvxBxbSVDgYFQrrW6pqtywlYqiWjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672603; c=relaxed/simple;
	bh=WDFCDJG0XW9mv6X/wek1PQBTCCLmxTfC3gOXkGrKMTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jM2/foN9qIStrErkOznJ1vJYqMt1on2KPZQG5M5lf+CQBEKk2qXQY7IwpYmn6b9naR3qDQ3xvATp3FPi4UsD16Z/YgMMSOpyIkB/yGHQBIntHBSM9uKL/mJwjsvAOIe1o1ZXRlAt1GORbtjG9nmd90JPrYtQv+tNUTgzX27MTYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca; spf=pass smtp.mailfrom=r-sc.ca; dkim=pass (2048-bit key) header.d=r-sc.ca header.i=@r-sc.ca header.b=X7ydc0pC; arc=none smtp.client-ip=66.29.159.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=r-sc.ca
Received: from [10.0.0.87] (S0106dceb699ec90f.pk.shawcable.net [24.69.43.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4fZHqw6Dc4z8sWQ;
	Mon, 16 Mar 2026 14:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-sc.ca;
	s=spacemail; t=1773672158;
	bh=N/LpcTgReEWNUHC2VOp+35BTXD1fWicKW1xp4roGZMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X7ydc0pCIQmARcPIsePo3QSZjzm5CYtfHhUHHzxLfY32kLz5IqIz5JpFw+vV7jVUE
	 iNfLuDXTHLK77Gp7B87e7l9GBNm5ztwBZwe9UGElAwPOlSlQL9KrVHAkdU+ZY7gs8t
	 RfwrmRBnxaECTf23yNh2MtZDj/TvZRsV9hZ1aznNsJXYnZPWZj9NWannUsox2Jf4NS
	 o5S58ltBG2f2QkLdgq0jlWfHFJgW6IXmXoEAM95ZVUbwcod9M/PsCFKcyZiwczaSHh
	 p0aHNNthzVKNZICaeuoIXhO0xYGB99IKowsXp+0u00lpysnA++IyAftJpMLDxWdIjn
	 JzhG54HcqD6mw==
Message-ID: <23c44029-7fde-45f7-a21a-0fc440c31b00@r-sc.ca>
Date: Mon, 16 Mar 2026 07:42:34 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] media: hdmirx: snps, rk: Fix EDID injection with proper
 HPD toggle on RK3588
To: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org, hans.verkuil@cisco.com,
 ezequiel@collabora.com, benjamin.gaignard@collabora.com
References: <20260209061654.54757-1-ross@r-sc.ca>
 <0c1ee67c-953b-48a9-a8c0-3242bf7b14c7@kernel.org>
Content-Language: en-US
From: Ross Cawston <ross@r-sc.ca>
In-Reply-To: <0c1ee67c-953b-48a9-a8c0-3242bf7b14c7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Envelope-From: ross@r-sc.ca
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[r-sc.ca:s=spacemail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[r-sc.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55935-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross@r-sc.ca,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[r-sc.ca:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[r-sc.ca:dkim,r-sc.ca:email,r-sc.ca:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E003429BB41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-16 7:24 a.m., Hans Verkuil wrote:
> On 09/02/2026 07:16, Ross Cawston wrote:
>> The existing VIDIOC_S_EDID implementation writes EDID data but does not
>> properly trigger source renegotiation on RK3588 boards. This results in
>> no visible change to the source device despite the ioctl succeeding.
>>
>> Even re-plugging the HDMI cable does not trigger renegotiation on previous
>> versions of the driver. This version reliably triggers renegotiation on
>> EDID injection on tested hardware.
>>
>> Fix by mirroring the vendor BSP behavior:
>> - Disable HDMI and DMA IRQs to avoid races.
>> - Simulate plugout if 5V power is present.
>> - Toggle HPD low before write.
>> - Schedule a delayed hotplug workqueue (1000ms) to re-enable HPD and
>>    force renegotiation.
>>
>> Bump WAIT_SIGNAL_LOCK_TIME from 300ms to 600ms to ensure lock.
>>
>> This ensures custom EDIDs take effect reliably, allowing userspace to
>> force specific resolutions/timings.
>>
>> Tested on Orange Pi 5 Ultra and Radxa Rock 5B — sources now correctly
>> re-detect and lock to the new EDID modes.
>>
>> Signed-off-by: Ross Cawston <ross@r-sc.ca>
>>
>> ---
>>   drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 43 +++++++++++++++++------
>>   1 file changed, 37 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>> index abc123..def456 100644
>> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>> @@ -88,6 +88,10 @@
>>   	HDMIRX_NUM_RST,
>>   };
>>   
>> +#define WAIT_SIGNAL_LOCK_TIME		600
>> +#define NO_LOCK_CFG_RETRY_TIME		300
>> +#define WAIT_LOCK_STABLE_TIME		20
>> +
>>   static const char *const pix_fmt_str[] = {
>>   	"RGB888",
>>   	"YUV422",
>> @@ -620,6 +624,7 @@
>>   
>>   	hdmirx_update_bits(hdmirx_dev, SCDC_CONFIG, POWERPROVIDED, 0);
>>   	hdmirx_interrupts_setup(hdmirx_dev, false);
>> +	hdmirx_hpd_ctrl(hdmirx_dev, false);
>>   	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG6, HDMIRX_DMA_EN, 0);
>>   	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG4,
>>   			   LINE_FLAG_INT_EN |
>> @@ -680,16 +685,32 @@
>>   	 */
>>   	mutex_lock(&hdmirx_dev->work_lock);
>>   
>> +	/*
>> +	 * Some sources won't re-read EDID unless we avoid IRQ races and
>> +	 * force a full plugout/HPD low sequence. On several tested devices,
>> +	 * leaving IRQs enabled or skipping plugout kept the old EDID cached.
>> +	 */
> This is weird. There seem to be two (or more) different issues here: IRQ races
> and HPD low->high toggle.
>
> When updating the EDID the HPD must go low before updating the EDID, and
> go high at least 100 ms after it went low. Experience shows that 'HZ / 7'
> is a good value for HDMI receivers. 1000 ms as you are using below is overkill.
>
> So the HPD toggle is required, otherwise video sources won't re-read the EDID.
>
> The IRQ races must be something else, I'm not sure what.
>
> I would recommend splitting this up: first add the HPD toggle since without it
> video sources will not detect the EDID update at all.
That's fair - this was the patch that worked for me reliably after many 
revisions. I'll break it up and do some further investigation.
> Then follow up with other patches fixing whatever else is needed to make it
> work reliable. Video sources will know nothing about enabling/disabling the
> IRQ, so if that matters, then it is more likely that somehow keeping the IRQs
> interferes with updating the EDID.
>
> I think you need to better understand what is going on here :-)
Roger that. Thanks for the review.
> Regards,
>
> 	Hans
>
>> +	disable_irq(hdmirx_dev->hdmi_irq);
>> +	disable_irq(hdmirx_dev->dma_irq);
>> +
>> +	if (tx_5v_power_present(hdmirx_dev))
>> +		hdmirx_plugout(hdmirx_dev);
>> +
>>   	hdmirx_hpd_ctrl(hdmirx_dev, false);
>>   
>>   	if (edid->blocks) {
>>   		hdmirx_write_edid(hdmirx_dev, edid);
>> -		hdmirx_hpd_ctrl(hdmirx_dev, true);
>>   	} else {
>>   		cec_phys_addr_invalidate(hdmirx_dev->cec->adap);
>>   		hdmirx_dev->edid_blocks_written = 0;
>>   	}
>>   
>> +	enable_irq(hdmirx_dev->dma_irq);
>> +	enable_irq(hdmirx_dev->hdmi_irq);
>> +
>> +	queue_delayed_work(system_unbound_wq, &hdmirx_dev->delayed_work_hotplug,
>> +			   msecs_to_jiffies(1000));
>> +
>>   	mutex_unlock(&hdmirx_dev->work_lock);
>>   
>>   	return 0;
>> @@ -2082,9 +2103,9 @@
>>   {
>>   	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
>>   	u32 mu_status, scdc_status, dma_st10, cmu_st;
>> -	u32 i;
>> +	u32 i, j = 0;
>>   
>> -	for (i = 0; i < 300; i++) {
>> +	for (i = 1; i < WAIT_SIGNAL_LOCK_TIME; i++) {
>>   		mu_status = hdmirx_readl(hdmirx_dev, MAINUNIT_STATUS);
>>   		scdc_status = hdmirx_readl(hdmirx_dev, SCDC_REGBANK_STATUS3);
>>   		dma_st10 = hdmirx_readl(hdmirx_dev, DMA_STATUS10);
>> @@ -2093,8 +2114,16 @@
>>   		if ((mu_status & TMDSVALID_STABLE_ST) &&
>>   		    (dma_st10 & HDMIRX_LOCK) &&
>>   		    (cmu_st & TMDSQPCLK_LOCKED_ST))
>> +			j++;
>> +		else
>> +			j = 0;
>> +
>> +		if (j > WAIT_LOCK_STABLE_TIME)
>>   			break;
>>   
>> +		if (i % NO_LOCK_CFG_RETRY_TIME == 0)
>> +			hdmirx_phy_config(hdmirx_dev);
>> +
>>   		if (!tx_5v_power_present(hdmirx_dev)) {
>>   			v4l2_dbg(1, debug, v4l2_dev,
>>   				 "%s: HDMI pull out, return\n", __func__);
>> @@ -2104,7 +2133,7 @@
>>   		hdmirx_tmds_clk_ratio_config(hdmirx_dev);
>>   	}
>>   
>> -	if (i == 300) {
>> +	if (i == WAIT_SIGNAL_LOCK_TIME) {
>>   		v4l2_err(v4l2_dev, "%s: signal not lock, tmds_clk_ratio:%d\n",
>>   			 __func__, hdmirx_dev->tmds_clk_ratio);
>>   		v4l2_err(v4l2_dev, "%s: mu_st:%#x, scdc_st:%#x, dma_st10:%#x\n",
>> @@ -2127,7 +2156,8 @@
>>   				   PKTDEC_AVIIF_RCV_IRQ, 0);
>>   	}
>>   
>> -	msleep(50);
>> +	hdmirx_reset_dma(hdmirx_dev);
>> +	msleep(500);
>>   	hdmirx_format_change(hdmirx_dev);
>>   
>>   	return 0;
>> @@ -2141,6 +2171,7 @@
>>   	hdmirx_submodule_init(hdmirx_dev);
>>   	hdmirx_update_bits(hdmirx_dev, SCDC_CONFIG, POWERPROVIDED,
>>   			   POWERPROVIDED);
>> +	hdmirx_hpd_ctrl(hdmirx_dev, true);
>>   	hdmirx_phy_config(hdmirx_dev);
>>   	hdmirx_interrupts_setup(hdmirx_dev, true);
>>   
>>

