Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51377305944
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 12:10:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236383AbhA0LJR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 06:09:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:58154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236246AbhA0LHK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 06:07:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88C8020729;
        Wed, 27 Jan 2021 11:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611745588;
        bh=3fN8JPHk+x/RyJQY9KhwRhUJDlPlpFnkg+0Nh7HoQJ4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=d7ZnWAbMzDduIgIi5iGdvb9OM0QFrF2gY8WE31NEORBKRH9gHZRZJV+HEEuFiQ1ne
         JptfdV1q+30PEJMeSmvCopiGvOulU7d8g4MyUXH7Uk+bi4IcnWijX3K4D1RuMOeArr
         2MLnpi+EpSwXEmfzisrBFxoRO2574ztktk1cYxJtYNoiFsdU38TanJcvRD5Kg0Eqrq
         QAg8yV9YypQP5xTszXayCzDkQt1PD9dmErcRAjTDJw0sd3qs5dSTA5SWGstkk1hJDt
         KwpgvJKV/m/XsHEFuBqMYmqvabhJPiZ/+tLiylNL9eUoGbG4ode+rkrC0OOO9KUhb5
         8tpLl4Sck2wlg==
Date:   Wed, 27 Jan 2021 12:06:23 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.o,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: vidtv: add initial debugfs interface
Message-ID: <20210127120623.7f018471@coco.lan>
In-Reply-To: <20201224150402.1945788-3-dwlsalmeida@gmail.com>
References: <20201224150402.1945788-3-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 24 Dec 2020 12:04:02 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Add a debugfs interface for testing purposes  that can be enabled
> by selecting **DVB_VIDTV_DEBUGFS**. This makes it possible to:
> 
> dynamically inject errors at runtime by interacting with the files
> at /sys/kernel/debug/vidtv/*
> 
> read some dvbv5 statistics from userspace more easily.
> 
> This is entirely optional and the driver will work without this option
> selected.

Patches 1 and 2 on this series seem OK. I'm applying them, after
testing.

Please see the notes below for this one.

> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  .../driver-api/media/drivers/vidtv.rst        |  80 +++---
>  drivers/media/test-drivers/vidtv/Kconfig      |  13 +
>  .../media/test-drivers/vidtv/vidtv_bridge.c   |  13 +
>  .../media/test-drivers/vidtv/vidtv_bridge.h   |   2 +
>  .../media/test-drivers/vidtv/vidtv_debugfs.h  |  42 +++
>  drivers/media/test-drivers/vidtv/vidtv_mux.c  | 272 ++++++++++++++++++
>  drivers/media/test-drivers/vidtv/vidtv_mux.h  |   7 +
>  drivers/media/test-drivers/vidtv/vidtv_ts.c   |   8 +
>  drivers/media/test-drivers/vidtv/vidtv_ts.h   |   8 +
>  9 files changed, 412 insertions(+), 33 deletions(-)
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_debugfs.h
> 
> diff --git a/Documentation/driver-api/media/drivers/vidtv.rst b/Documentation/driver-api/media/drivers/vidtv.rst
> index 673bdff919ea..e7c450289774 100644
> --- a/Documentation/driver-api/media/drivers/vidtv.rst
> +++ b/Documentation/driver-api/media/drivers/vidtv.rst
> @@ -227,6 +227,9 @@ vidtv_mux.[ch]
>  	#. Delivering the resulting TS packets to the bridge
>  	   driver so it can pass them to the demux.
>  
> +vidtv_debugfs.h
> +	Exposes data structures used in vidtv's debugfs interface.
> +
>  Testing vidtv with v4l-utils
>  ----------------------------
>  
> @@ -431,27 +434,53 @@ For more information on dvb-zap check its online documentation here:
>  See also: `zap <https://www.linuxtv.org/wiki/index.php/Zap>`_.
>  
>  
> -What can still be improved in vidtv
> ------------------------------------
> +Vidtv *debugfs* integration
> +___________________________
> +
> +Vidtv now comes with a *debugfs* interface that can be enabled by selecting
> +**DVB_VIDTV_DEBUGFS**. Using it, one can

"now comes" -> "can be compiled"

> +
> +#. dynamically inject errors at runtime by interacting with the files at /sys/kernel/debug/vidtv/*
> +
> +#. read some dvbv5 statistics from userspace more easily
> +
> +.. note::
> +	This is entirely optional and the driver will work without this option selected.


Please keep lines <= 80 columns, except when there's a strong reason to
use longer lines. The same applies to other parts of this patch.

> +
> +At boot, vidtv will set up a directory per simulated frontend. Here is a list of
> +created files and their associated functionality once they are written to:
> +
> +noise
> +	The probability of adding random noise in the packets (0 - 10000).
> +drop
> +	Drop n packets at random
> +shl
> +	Shift left n bytes at random
> +shr
> +	Shift right n bytes at random
> +discontinuity
> +	Create n discontinuities at random. This means artificially increasing
> +	the continuity counters such that a discontinuity error is generated.
> +
> +Another option is to provide a probability of such events ocurring. Drop, shl,
> +shr, and discontinuity have versions that take in a probability in the [0,
> +10000] range.
>  
> -Add *debugfs* integration
> -~~~~~~~~~~~~~~~~~~~~~~~~~
> +Writing to the files at the frontend directory will target all packets in the
> +mux buffer. Alternatively, vidtv will also create a directory per PID. Writing
> +to these files will, in turn, only affect that particular PID.
>  
> -Although frontend drivers provide DVBv5 statistics via the .read_status
> -call, a nice addition would be to make additional statistics available to
> -userspace via debugfs, which is a simple-to-use, RAM-based filesystem
> -specifically designed for debug purposes.
>  
> -The logic for this would be implemented on a separate file so as not to
> -pollute the frontend driver.  These statistics are driver-specific and can
> -be useful during tests.
> +What can still be improved in vidtv
> +-----------------------------------
> +
> +Improve debugfs support
> +~~~~~~~~~~~~~~~~~~~~~~~
>  
> -The Siano driver is one example of a driver using
> -debugfs to convey driver-specific statistics to userspace and it can be
> -used as a reference.
> +Vidtv offers support for dynamically injecting errors and retrieving some dvbv5
> +stats via *debugfs*. This can be improved upon to add new ways of testing from
> +userspace.
>  
> -This should be further enabled and disabled via a Kconfig
> -option for convenience.
>  
>  Add a way to test video
>  ~~~~~~~~~~~~~~~~~~~~~~~
> @@ -468,23 +497,6 @@ which resides at::
>  	drivers/media/common/v4l2-tpg/
>  
>  
> -Add white noise simulation
> -~~~~~~~~~~~~~~~~~~~~~~~~~~
> -
> -The vidtv tuner already has code to identify whether the chosen frequency
> -is too far away from a table of valid frequencies. For now, this means that
> -the demodulator can eventually lose the lock on the signal, since the tuner will
> -report a bad signal quality.
> -
> -A nice addition is to simulate some noise when the signal quality is bad by:
> -
> -- Randomly dropping some TS packets. This will trigger a continuity error if the
> -  continuity counter is updated but the packet is not passed on to the demux.
> -
> -- Updating the error statistics accordingly (e.g. BER, etc).
> -
> -- Simulating some noise in the encoded data.
> -
>  Functions and structs used within vidtv
>  ---------------------------------------
>  
> @@ -511,3 +523,5 @@ Functions and structs used within vidtv
>  .. kernel-doc:: drivers/media/test-drivers/vidtv/vidtv_common.c
>  
>  .. kernel-doc:: drivers/media/test-drivers/vidtv/vidtv_tuner.c
> +
> +.. kernel-doc:: drivers/media/test-drivers/vidtv/vidtv_debugfs.h
> diff --git a/drivers/media/test-drivers/vidtv/Kconfig b/drivers/media/test-drivers/vidtv/Kconfig
> index 22c4fd39461f..05513f1c67e1 100644
> --- a/drivers/media/test-drivers/vidtv/Kconfig
> +++ b/drivers/media/test-drivers/vidtv/Kconfig
> @@ -8,4 +8,17 @@ config DVB_VIDTV
>  	  working on userspace applications.
>  
>  
> +	  When in doubt, say N.
> +
> +config DVB_VIDTV_DEBUGFS
> +	bool "Enable debugfs for vidtv"
> +	depends on DVB_VIDTV
> +	depends on DEBUG_FS
> +
> +	help
> +	  Choose Y to enable the vidtv debugfs interface. Currently allows for
> +	  dynamically introducing errors in the generated MPEG Transport Stream
> +	  for testing purposes.
> +
> +
>  	  When in doubt, say N.
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
> index fc64d0c8492a..d5ebe680724f 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
> @@ -10,6 +10,7 @@
>   * Copyright (C) 2020 Daniel W. S. Almeida
>   */
>  
> +#include <linux/debugfs.h>
>  #include <linux/dev_printk.h>
>  #include <linux/moduleparam.h>
>  #include <linux/mutex.h>
> @@ -172,6 +173,7 @@ static int vidtv_start_streaming(struct vidtv_dvb *dvb)
>  		.transport_stream_id         = VIDTV_DEFAULT_TS_ID,
>  		.network_id                  = VIDTV_DEFAULT_NETWORK_ID,
>  		.network_name                = VIDTV_DEFAULT_NETWORK_NAME,
> +		.debugfs_root                = dvb->debugfs_root,
>  		.priv                        = dvb,
>  	};
>  	struct device *dev = &dvb->pdev->dev;
> @@ -485,6 +487,7 @@ static int vidtv_bridge_dvb_init(struct vidtv_dvb *dvb)
>  static int vidtv_bridge_probe(struct platform_device *pdev)
>  {
>  	struct vidtv_dvb *dvb;
> +	struct dentry *debugfs_root;
>  	int ret;
>  
>  	dvb = kzalloc(sizeof(*dvb), GFP_KERNEL);
> @@ -501,6 +504,12 @@ static int vidtv_bridge_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, dvb);
>  
> +#ifdef CONFIG_DVB_VIDTV_DEBUGFS
> +	debugfs_root = debugfs_create_dir("vidtv", NULL);
> +	if (!IS_ERR(debugfs_root))
> +		dvb->debugfs_root = debugfs_root;
> +#endif //CONFIG_DVB_VIDTV_DEBUGFS
> +

While C99 comments are now allowed, we still prefer to use C89 ones:


#endif /* CONFIG_DVB_VIDTV_DEBUGFS */

(also, please add a space after the comment tag, as it makes easier
for read the comment)

>  	dev_info(&pdev->dev, "Successfully initialized vidtv!\n");
>  	return ret;
>  
> @@ -516,6 +525,10 @@ static int vidtv_bridge_remove(struct platform_device *pdev)
>  
>  	dvb = platform_get_drvdata(pdev);
>  
> +#ifdef CONFIG_DVB_VIDTV_DEBUGFS
> +	debugfs_remove_recursive(dvb->debugfs_root);
> +#endif //CONFIG_DVB_VIDTV_DEBUGFS
> +
>  	mutex_destroy(&dvb->feed_lock);
>  
>  	for (i = 0; i < NUM_FE; ++i) {
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.h b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
> index 2528adaee27d..9ef37d8ad2cc 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_bridge.h
> +++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
> @@ -42,6 +42,7 @@
>   * @feed_lock: Protects access to the start/stop stream logic/data.
>   * @streaming: Whether we are streaming now.
>   * @mux: The abstraction responsible for delivering MPEG TS packets to the bridge.
> + * @debugfs_root: A handle to vidtv's debugfs directory
>   */
>  struct vidtv_dvb {
>  	struct platform_device *pdev;
> @@ -60,6 +61,7 @@ struct vidtv_dvb {
>  	bool streaming;
>  
>  	struct vidtv_mux *mux;
> +	struct dentry *debugfs_root;
>  };
>  
>  #endif // VIDTV_BRIDG_H
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_debugfs.h b/drivers/media/test-drivers/vidtv/vidtv_debugfs.h
> new file mode 100644
> index 000000000000..1743fe6d96cf
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_debugfs.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Vidtv serves as a reference DVB driver and helps validate the existing APIs
> + * in the media subsystem. It can also aid developers working on userspace
> + * applications.
> + *
> + * Copyright (C) 2020 Daniel W. S. Almeida
> + */
> +
> +#ifndef VIDTV_DEBUGFS_H
> +#define VIDTV_DEBUGFS_H
> +#include <linux/debugfs.h>
> +
> +/**
> + * struct vidtv_debugfs - Represents the vidtv debugfs interface
> + *
> + * @dir_dentry: A handle to the debugfs dentry
> + * @noise: Probability of adding noise to a byte in a packet [0, 10000]
> + * @drop: Drop n packets at random.
> + * @drop_probability: Probability to randomly drop a packet [0, 10000]
> + * @shl_probability: Probability to randomly shift left a byte in a packet [0, 10000]
> + * @shr_probability: Probability to randomly shift right a byte in a packet [0, 10000]
> + * @discontinuity_probability: Probability of artificially creating a
> + * discontinuity error [0, 10000]
> + * @shl: Shift n bytes left at random, i.e. byte[i] = byte[i] << 1;
> + * @shr: Shift n bytes right at random, i.e. byte[i] = byte[i] >>1;
> + * @discontinuity: Create n discontinuity errors
> + */
> +struct vidtv_debugfs {
> +	struct dentry *dir_dentry;
> +	u32 noise;
> +	u32 drop_probability;
> +	u32 shl_probability;
> +	u32 shr_probability;
> +	u32 discontinuity_probability;
> +	u32 drop;
> +	u32 shl;
> +	u32 shr;
> +	u32 discontinuity;
> +};
> +
> +#endif //VIDTV_DEBUGFS_H
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
> index b51e6a3b8cbe..e6d69fe01908 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
> @@ -12,11 +12,14 @@
>   * Copyright (C) 2020 Daniel W. S. Almeida
>   */
>  
> +#include "vidtv_debugfs.h"
> +#include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/dev_printk.h>
>  #include <linux/jiffies.h>
>  #include <linux/kernel.h>
>  #include <linux/math64.h>
> +#include <linux/random.h>
>  #include <linux/ratelimit.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> @@ -385,6 +388,204 @@ static void vidtv_mux_clear(struct vidtv_mux *m)
>  	m->mux_buf_offset = 0;
>  }
>  

> +static void vidtv_mux_add_random_noise(struct vidtv_mux *m, u32 noise_prob, u32 pkt_start)
> +{
> +	u8 noise;
> +	u8 *pkt = m->mux_buf + pkt_start;
> +	u32 i;
> +
> +	for (i = 0; i < TS_PACKET_LEN; i++)
> +		if (prandom_u32_max(10000) < noise_prob) {
> +			noise = prandom_u32_max(0xff);
> +			pkt[i] = pkt[i] + noise;
> +		}
> +}
> +
> +static void vidtv_mux_drop_random(struct vidtv_mux *m, u32 drop_prob, u32 pkt_start, u32 *nbytes)
> +{
> +	u8 *pkt = m->mux_buf + pkt_start;
> +	u8 *last_pkt = m->mux_buf + m->mux_buf_offset - TS_PACKET_LEN;
> +	u32 npkts = m->mux_buf_offset / 188;
> +
> +	if (!npkts)
> +		return;
> +
> +	if (prandom_u32_max(10000) < drop_prob) {
> +		if (npkts > 1 && pkt != last_pkt) {
> +			//overwrite victim with last packet
> +			memcpy(pkt, last_pkt, TS_PACKET_LEN);
> +			//remove last packet from buffer
> +			memset(last_pkt, 0, TS_PACKET_LEN);
> +		} else {
> +			//just erase it
> +			memset(pkt, 0, TS_PACKET_LEN);
> +		}
> +
> +		//keep track of the loss of this packet
> +		m->mux_buf_offset -= TS_PACKET_LEN;
> +		*nbytes -= TS_PACKET_LEN;
> +	}
> +}
> +
> +static void vidtv_mux_shl_random(struct vidtv_mux *m, u32 shl_prob, u32 pkt_start)
> +{
> +	u8 *pkt = m->mux_buf + pkt_start;
> +	/* select one of the 188 bytes at random */
> +	u8 *byte = pkt + prandom_u32_max(TS_PACKET_LEN);
> +
> +	if (prandom_u32_max(10000) < shl_prob)
> +		*byte = *byte << 1;
> +}
> +
> +static void vidtv_mux_shr_random(struct vidtv_mux *m, u32 shr_prob, u32 pkt_start)
> +{
> +	u8 *pkt = m->mux_buf + pkt_start;
> +	/* select one of the 188 bytes at random */
> +	u8 *byte = pkt + prandom_u32_max(TS_PACKET_LEN);
> +
> +	if (prandom_u32_max(10000) < shr_prob)
> +		*byte = *byte >> 1;
> +}
> +
> +static void vidtv_mux_discontinuity_random(struct vidtv_mux *m, u32 disc_prob, u16 pid)
> +{
> +	struct vidtv_mux_pid_ctx *ctx = vidtv_mux_get_pid_ctx(m, pid);
> +
> +	/* if the pkt was previously corrupted such that we cannot retrieve its pid context
> +	 * anymore, then bail
> +	 */
> +	if (!ctx)
> +		return;
> +
> +	if (prandom_u32_max(10000) < disc_prob)
> +		vidtv_ts_inc_cc(&ctx->cc);
> +}
> +
> +static u32 vidtv_mux_get_random_pkt_offset(struct vidtv_mux *m)
> +{
> +	u32 npkts = m->mux_buf_offset / TS_PACKET_LEN;
> +	u32 pkt_offset = prandom_u32_max(npkts) * TS_PACKET_LEN;
> +
> +	return pkt_offset;
> +}
> +
> +static u32 vidtv_mux_get_random_pkt_offset_for_pid(struct vidtv_mux *m, u16 pid, bool *found)
> +{
> +	u32 npkts_total = m->mux_buf_offset / TS_PACKET_LEN;
> +	u8 *buf = kcalloc(npkts_total, sizeof(u32), GFP_KERNEL);
> +	u32 npkt = 0;
> +	u32 pkt_offset = 0;
> +	u32 offset;
> +	u16 pkt_pid;
> +
> +	for (offset = 0; offset < m->mux_buf_offset; offset += TS_PACKET_LEN) {
> +		pkt_pid = vidtv_ts_get_pid(&m->mux_buf[offset]);
> +		if (pkt_pid == pid) {
> +			buf[npkt] = offset;
> +			npkt++;
> +		}
> +	}
> +
> +	*found = (npkt != 0);
> +	pkt_offset = buf[prandom_u32_max(npkt)];
> +	kfree(buf);
> +	return pkt_offset;
> +}

Please create a drivers/media/test-drivers/vidtv/vidtv_debugfs.c file
and place everything related to debugfs on it.

At the header file, you would do:

	#if CONFIG_DVB_VIDTV_DEBUGFS

	u32 vidtv_mux_get_random_pkt_offset_for_pid(struct vidtv_mux *m, 
						    u16 pid, bool *found);

	#else
	static inline u32 vidtv_mux_get_random_pkt_offset_for_pid(struct vidtv_mux *m, 
							  	  u16 pid, bool *found)
	{
		return 0;
	}
#endif

for all functions. This way, the C files will be cleaner, as there
won't be any "#if" inside them, and the header files will declare
function stubs that will do nothing, which causes the compiler to
simply discard the entire function as a hole.

> +
> +static void vidtv_mux_handle_debugfs_input(struct vidtv_mux *m, u32 *nbytes)
> +{
> +	struct vidtv_mux_pid_ctx *ctx;
> +	u32 pkt_offset;
> +	u16 pid;
> +	int bkt;
> +	bool found;
> +	u32 offset;
> +
> +#ifndef CONFIG_DVB_VIDTV_DEBUGFS
> +	return;
> +#endif //CONFIG_DVB_VIDTV_DEBUGFS

Never do that! if compiled without CONFIG_DVB_VIDTV_DEBUGFS, there
will be dead code at the function.

> +
> +	if (m->mux_buf_offset == 0)
> +		return;
> +
> +	while (m->debugfs.discontinuity > 0) {
> +		pkt_offset = vidtv_mux_get_random_pkt_offset(m);
> +		pid = vidtv_ts_get_pid(&m->mux_buf[pkt_offset]);
> +		vidtv_mux_discontinuity_random(m, 10000, pid);
> +		m->debugfs.discontinuity--;
> +	}
> +
> +	while (m->debugfs.drop > 0) {
> +		pkt_offset = vidtv_mux_get_random_pkt_offset(m);
> +		vidtv_mux_drop_random(m, 10000, pkt_offset, nbytes);
> +		m->debugfs.drop--;
> +	}
> +
> +	while (m->debugfs.shl > 0) {
> +		pkt_offset = vidtv_mux_get_random_pkt_offset(m);
> +		vidtv_mux_shl_random(m, 10000, pkt_offset);
> +		m->debugfs.shl--;
> +	}
> +
> +	while (m->debugfs.shr > 0) {
> +		pkt_offset = vidtv_mux_get_random_pkt_offset(m);
> +		vidtv_mux_shr_random(m, 10000, pkt_offset);
> +		m->debugfs.shr--;
> +	}
> +
> +	for (offset = 0; offset < m->mux_buf_offset; offset += TS_PACKET_LEN) {
> +		pid = vidtv_ts_get_pid(&m->mux_buf[offset]);
> +		vidtv_mux_discontinuity_random(m, m->debugfs.discontinuity_probability, pid);
> +		vidtv_mux_add_random_noise(m, m->debugfs.noise, offset);
> +		vidtv_mux_drop_random(m, m->debugfs.drop_probability, offset, nbytes);
> +		vidtv_mux_shl_random(m, m->debugfs.shl_probability, offset);
> +		vidtv_mux_shr_random(m, m->debugfs.shr_probability, offset);
> +	}
> +
> +	hash_for_each(m->pid_ctx, bkt, ctx, h) {
> +		while (ctx->debugfs.discontinuity > 0) {
> +			pkt_offset = vidtv_mux_get_random_pkt_offset_for_pid(m, ctx->pid, &found);
> +			vidtv_mux_discontinuity_random(m, 10000, ctx->pid);
> +			ctx->debugfs.discontinuity--;
> +		}
> +
> +		while (ctx->debugfs.drop > 0) {
> +			pkt_offset = vidtv_mux_get_random_pkt_offset_for_pid(m, ctx->pid, &found);
> +			if (found)
> +				vidtv_mux_drop_random(m, 10000, pkt_offset, nbytes);
> +			ctx->debugfs.drop--;
> +		}
> +
> +		while (ctx->debugfs.shl > 0) {
> +			pkt_offset = vidtv_mux_get_random_pkt_offset_for_pid(m, ctx->pid, &found);
> +			if (found)
> +				vidtv_mux_shl_random(m, 10000, pkt_offset);
> +			ctx->debugfs.shl--;
> +		}
> +
> +		while (ctx->debugfs.shr > 0) {
> +			pkt_offset = vidtv_mux_get_random_pkt_offset_for_pid(m, ctx->pid, &found);
> +			if (found)
> +				vidtv_mux_shr_random(m, 10000, pkt_offset);
> +			ctx->debugfs.shr--;
> +		}
> +
> +		for (offset = 0; offset < m->mux_buf_offset; offset += TS_PACKET_LEN) {
> +			pid = vidtv_ts_get_pid(&m->mux_buf[offset]);
> +			if (ctx->pid == pid) {
> +				vidtv_mux_discontinuity_random(m,
> +							       m->debugfs.discontinuity_probability,
> +							       pid);
> +				vidtv_mux_add_random_noise(m, ctx->debugfs.noise, offset);
> +				vidtv_mux_drop_random(m, ctx->debugfs.drop_probability,
> +						      offset, nbytes);
> +				vidtv_mux_shl_random(m, ctx->debugfs.shl_probability, offset);
> +				vidtv_mux_shr_random(m, ctx->debugfs.shr_probability, offset);
> +			}
> +		}
> +	}
> +}
> +
>  #define ERR_RATE 10000000
>  static void vidtv_mux_tick(struct work_struct *work)
>  {
> @@ -410,6 +611,7 @@ static void vidtv_mux_tick(struct work_struct *work)
>  		nbytes += vidtv_mux_poll_encoders(m);
>  		nbytes += vidtv_mux_pad_with_nulls(m, 256);
>  
> +		vidtv_mux_handle_debugfs_input(m, &nbytes);
>  		npkts = nbytes / TS_PACKET_LEN;
>  
>  		/* if the buffer is not aligned there is a bug somewhere */
> @@ -474,6 +676,71 @@ void vidtv_mux_stop_thread(struct vidtv_mux *m)
>  	}
>  }
>  
> +static void vidtv_mux_debugfs_init(struct vidtv_mux *m, struct dentry *parent)
> +{
> +	struct dentry *frontend_dir;
> +	struct dentry *pid_dir;
> +	struct vidtv_mux_pid_ctx *ctx;
> +	int bkt;
> +	char name[16];
> +	struct dtv_frontend_properties *c;
> +
> +#ifndef CONFIG_DVB_VIDTV_DEBUGFS
> +	return;
> +#endif //CONFIG_DVB_VIDTV_DEBUGFS

Same above notes apply here: place it on a separate C file and don't
keep dead code, using the inline void do-nothing functions at the header,
if compiled without CONFIG_DVB_VIDTV_DEBUGFS.

> +
> +	c = &m->fe->dtv_property_cache;
> +	//Change this if vidtv ever supports simulating more than one frontend
> +	frontend_dir = debugfs_create_dir("frontend0", parent);
> +	if (IS_ERR(frontend_dir))
> +		return;
> +
> +	debugfs_create_u64("pre_bit_count", 0444, frontend_dir, &c->pre_bit_count.stat[0].uvalue);
> +	debugfs_create_u64("post_bit_count", 0444, frontend_dir, &c->post_bit_count.stat[0].uvalue);
> +	debugfs_create_u64("block_count", 0444, frontend_dir, &c->block_count.stat[0].uvalue);
> +
> +	/* these work at random for any PID in this mux */
> +	debugfs_create_u32("noise", 0644, frontend_dir, &m->debugfs.noise);
> +	debugfs_create_u32("drop_probability", 0644, frontend_dir, &m->debugfs.drop_probability);
> +	debugfs_create_u32("shl_probability", 0644, frontend_dir, &m->debugfs.shl_probability);
> +	debugfs_create_u32("shr_probability", 0644, frontend_dir, &m->debugfs.shr_probability);
> +	debugfs_create_u32("discontinuity_probability", 0644, frontend_dir,
> +			   &m->debugfs.discontinuity_probability);
> +	debugfs_create_u32("drop", 0644, frontend_dir, &m->debugfs.drop);
> +	debugfs_create_u32("shl", 0644, frontend_dir, &m->debugfs.shl);
> +	debugfs_create_u32("shr", 0644, frontend_dir, &m->debugfs.shr);
> +	debugfs_create_u32("discontinuity", 0644, frontend_dir, &m->debugfs.discontinuity);
> +
> +	hash_for_each(m->pid_ctx, bkt, ctx, h) {
> +		memset(name, 0, ARRAY_SIZE(name));
> +		snprintf(name, ARRAY_SIZE(name), "PID_%d", ctx->pid);
> +
> +		pid_dir = debugfs_create_dir(name, frontend_dir);
> +		if (IS_ERR(pid_dir))
> +			return;
> +
> +		/* these will affect the chosen PID only */
> +		debugfs_create_u32("noise", 0644, pid_dir, &ctx->debugfs.noise);
> +		debugfs_create_u32("drop_probability", 0644, pid_dir,
> +				   &ctx->debugfs.drop_probability);
> +		debugfs_create_u32("shl_probability", 0644, pid_dir,
> +				   &ctx->debugfs.shl_probability);
> +		debugfs_create_u32("shr_probability", 0644, pid_dir,
> +				   &ctx->debugfs.shr_probability);
> +		debugfs_create_u32("discontinuity_probability", 0644, pid_dir,
> +				   &ctx->debugfs.discontinuity_probability);
> +		debugfs_create_u32("drop", 0644, pid_dir, &ctx->debugfs.drop);
> +		debugfs_create_u32("shl", 0644, pid_dir, &ctx->debugfs.shl);
> +		debugfs_create_u32("shr", 0644, pid_dir, &ctx->debugfs.shr);
> +		debugfs_create_u32("discontinuity", 0644, pid_dir,
> +				   &ctx->debugfs.discontinuity);
> +
> +		ctx->debugfs.dir_dentry = pid_dir;
> +	}
> +
> +	m->debugfs.dir_dentry = frontend_dir;
> +}
> +
>  struct vidtv_mux *vidtv_mux_init(struct dvb_frontend *fe,
>  				 struct device *dev,
>  				 struct vidtv_mux_init_args *args)
> @@ -521,6 +788,8 @@ struct vidtv_mux *vidtv_mux_init(struct dvb_frontend *fe,
>  	if (vidtv_mux_pid_ctx_init(m) < 0)
>  		goto free_channel_si;
>  
> +	vidtv_mux_debugfs_init(m, args->debugfs_root);
> +
>  	return m;
>  
>  free_channel_si:
> @@ -542,5 +811,8 @@ void vidtv_mux_destroy(struct vidtv_mux *m)
>  	vidtv_channels_destroy(m);
>  	kfree(m->network_name);
>  	vfree(m->mux_buf);
> +#ifdef CONFIG_DVB_VIDTV_DEBUGFS
> +	debugfs_remove_recursive(m->debugfs.dir_dentry);
> +#endif //CONFIG_DVB_VIDTV_DEBUGFS

Instead, please do something like this at the .h file:


#ifdef CONFIG_DVB_VIDTV_DEBUGFS
...
vidtv_mux_debugfs_remove(...)
{
	debugfs_remove_recursive(m->debugfs.dir_dentry);
}
...
#else
...
static inline vidtv_mux_debugfs_remove(...) {}
...
#endif

and just call it unconditionally here.


>  	kfree(m);
>  }
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.h b/drivers/media/test-drivers/vidtv/vidtv_mux.h
> index ad82eb72b841..b6ca9f330afd 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_mux.h
> +++ b/drivers/media/test-drivers/vidtv/vidtv_mux.h
> @@ -22,6 +22,7 @@
>  #include <media/dvb_frontend.h>
>  
>  #include "vidtv_psi.h"
> +#include "vidtv_debugfs.h"
>  
>  /**
>   * struct vidtv_mux_timing - Timing related information
> @@ -77,11 +78,13 @@ struct vidtv_mux_si {
>   * @cc: The continuity counter for this PID. It is incremented on every TS
>   * pack and it will wrap around at 0xf0. If the decoder notices a sudden jump in
>   * this counter this will trigger a discontinuity state.
> + * @debugfs: debugfs interface for this mpeg pid
>   * @h: This is embedded in a hash table, mapping pid -> vidtv_mux_pid_ctx
>   */
>  struct vidtv_mux_pid_ctx {
>  	u16 pid;
>  	u8 cc; /* continuity counter */
> +	struct vidtv_debugfs debugfs;
>  	struct hlist_node h;
>  };
>  
> @@ -108,6 +111,7 @@ struct vidtv_mux_pid_ctx {
>   * @transport_stream_id: The transport stream ID
>   * @network_id: The network ID
>   * @network_name: The network name
> + * @debugfs: The debugfs interface for the whole mux, if any.
>   * @priv: Private data.
>   */
>  struct vidtv_mux {
> @@ -139,6 +143,7 @@ struct vidtv_mux {
>  	u16 transport_stream_id;
>  	u16 network_id;
>  	char *network_name;
> +	struct vidtv_debugfs debugfs;
>  	void *priv;
>  };
>  
> @@ -155,6 +160,7 @@ struct vidtv_mux {
>   * @channels: an optional list of channels to use
>   * @network_id: The network ID
>   * @network_name: The network name
> + * @debugfs_root: the debugfs root directory, if any
>   * @priv: Private data.
>   */
>  struct vidtv_mux_init_args {
> @@ -168,6 +174,7 @@ struct vidtv_mux_init_args {
>  	struct vidtv_channel *channels;
>  	u16 network_id;
>  	char *network_name;
> +	struct dentry *debugfs_root;
>  	void *priv;
>  };
>  
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.c b/drivers/media/test-drivers/vidtv/vidtv_ts.c
> index ca4bb9c40b78..dca6fa8afa57 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_ts.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_ts.c
> @@ -134,3 +134,11 @@ u32 vidtv_ts_pcr_write_into(struct pcr_write_args args)
>  
>  	return nbytes;
>  }
> +
> +u16 vidtv_ts_get_pid(u8 *pkt)
> +{
> +	struct vidtv_mpeg_ts *ts_pkt = (struct vidtv_mpeg_ts *)pkt;
> +	u16 bitfield = be16_to_cpu(ts_pkt->bitfield);
> +	u16 ret = bitfield & GENMASK(12, 0);
> +	return ret;
> +}
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.h b/drivers/media/test-drivers/vidtv/vidtv_ts.h
> index 09b4ffd02829..f19824021966 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_ts.h
> +++ b/drivers/media/test-drivers/vidtv/vidtv_ts.h
> @@ -103,4 +103,12 @@ u32 vidtv_ts_null_write_into(struct null_packet_write_args args);
>   */
>  u32 vidtv_ts_pcr_write_into(struct pcr_write_args args);
>  
> +/**
> + * vidtv_ts_get_pid - Extract the MPEG PID value out of a mpeg ts packet
> + * @pkt: pointer to packet
> + *
> + * Return: The mpeg ts pid in cpu endianness
> + */
> +u16 vidtv_ts_get_pid(u8 *pkt);
> +
>  #endif //VIDTV_TS_H



Thanks,
Mauro
