Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57A2A589864
	for <lists+linux-media@lfdr.de>; Thu,  4 Aug 2022 09:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238967AbiHDHaU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Aug 2022 03:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232987AbiHDHaS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Aug 2022 03:30:18 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DF06175
        for <linux-media@vger.kernel.org>; Thu,  4 Aug 2022 00:30:16 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id f22so13213685edc.7
        for <linux-media@vger.kernel.org>; Thu, 04 Aug 2022 00:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc;
        bh=xiNxGwoDzvLinzDbDRaMJgjXa9JQzG8Dc9gxLOBuJuU=;
        b=cpWr79oyvPTe7pTAQoSOIlrJpWuartFa58khJHqgQpcpYmo6cdxwQwPJTj2/WVyFsY
         9gJXzc9rgxfe+8OBwU4BuApx+AemI4BZdVYeP6GLr5vkRkt7rsHzUl9SaoD9gtzBl/IL
         vUncY8oFtJjy4AjRoNIPxWnUc/vMf4zOx9dX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=xiNxGwoDzvLinzDbDRaMJgjXa9JQzG8Dc9gxLOBuJuU=;
        b=YrJ4qfoFs7Isdh1+8rQAwS8/C0z/aOEM+mzC77EP8i1dSm9lACg5Gx6IwEq8IDN8wA
         wh5UrpZqqpaktW3aacXcnCUeu1F3u8O/8Kq5yhJ60SsGavYCpN0cQ7bKNCYJW2uysWU9
         wzy9YS2sSErcyoF7h47kHFlyG1tRJtSHd5/hJquB5UpDU6lvVehmkECSvnRRPPCtYGck
         lxlw4ZQvALQjBxTfceXFDNFTkt+thjUUlcr1XErjuaLyiSTn6qtvZY8LvokvHmCoOJnx
         6H3wpO59cV6FOdZMySXugt0WODiBjrFw3iaIq6Eyrms3V5eY0pnEr0NkI7tjydntqav+
         aFRw==
X-Gm-Message-State: ACgBeo0RXz+VY8QSq3tuK06MJ68uX6KGqp4x+YjUxeLOUk9DTzog9uD0
        veBtZWLHhMlML43xdkPJqHrIy067lUuvxw==
X-Google-Smtp-Source: AA6agR4Ch8CwOc36xRTg/LTzZToX0ATnju9Ha2D15X1Lq30aUgKtj/dSTUo68ua8/Ldzs+zm4hfEhg==
X-Received: by 2002:a05:6402:2387:b0:43d:3e0:4daf with SMTP id j7-20020a056402238700b0043d03e04dafmr699910eda.208.1659598215328;
        Thu, 04 Aug 2022 00:30:15 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-51-7.cust.vodafonedsl.it. [188.217.51.7])
        by smtp.gmail.com with ESMTPSA id i8-20020a170906250800b0072ecef772acsm60171ejb.2.2022.08.04.00.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 00:30:15 -0700 (PDT)
Date:   Thu, 4 Aug 2022 09:30:13 +0200
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     hverkuil@xs4all.nl
Cc:     linux-media <linux-media@vger.kernel.org>
Subject: vivid, vivid-kthread-touch.c migration to hrtimer
Message-ID: <20220804073013.GA9180@tom-ThinkPad-T14s-Gen-2i>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,
I try to handle "V4L2: vivid: improve timestamping" task in
https://www.linuxtv.org/wiki/index.php/Media_Open_Source_Projects:_Looking_for_Volunteers

I do a first try on using hrtimer on vivi-kthread-touch.c
I have some doubt on my things :'(

In particular on the following formulas:

buffers_since_start =
                 denominator * time_since_start / NSEC_PER_SEC;


next_time_buf_start =
                 time_since_start / buffers_since_start;


I post also the entire hrtimer func:

static enum hrtimer_restart vivid_hrtimer_touch_cap(struct hrtimer *hrtimer)
{
	struct vivid_dev *dev = container_of(hrtimer,
							struct vivid_dev, hrtimer_touch_cap);
	unsigned int numerator, denominator;
	ktime_t now;
	s64 time_since_start, next_time_buf_start;
	u64 buffers_since_start, numerators_since_start;
	int dropped_bufs;

	/* Resets frame counters first time */
	if (!dev->hrtimer_touch_cap_started) {

		dprintk(dev, 1, "Touch Capture Thread Start\n");

		dev->touch_cap_seq_offset = 0;
		dev->touch_cap_seq_count = 0;
		dev->touch_cap_seq_resync = false;
		dev->time_touch_cap = hrtimer_cb_get_time(hrtimer);

		if (dev->time_wrap)
			dev->time_wrap_offset = dev->time_wrap - ktime_get_ns();
		else
			dev->time_wrap_offset = 0;

		dev->hrtimer_touch_cap_started = true;
	}

	now = hrtimer_cb_get_time(hrtimer);

	if (dev->touch_cap_seq_resync) {
		dev->time_touch_cap = hrtimer_cb_get_time(hrtimer);
		dev->touch_cap_seq_offset = dev->touch_cap_seq_count + 1;
		dev->touch_cap_seq_count = 0;
		dev->cap_seq_resync = false;
	}

	denominator = dev->timeperframe_tch_cap.denominator;
	numerator = dev->timeperframe_tch_cap.numerator;

	time_since_start =
		ktime_to_ns(now) - ktime_to_ns(dev->time_touch_cap);

	// printk("ktime_to_ms(now) = %lld", ktime_to_ms(now));
	// printk("ktime_to_ms(dev->time_touch_cap) = %lld", ktime_to_ms(dev->time_touch_cap));
	// printk("time_since_start = %lld\n",time_since_start);

	buffers_since_start =
		denominator * time_since_start / NSEC_PER_SEC;

	// printk("buffer_since_start = %lld\n",buffers_since_start);

	dropped_bufs =
		buffers_since_start + dev->touch_cap_seq_offset - dev->touch_cap_seq_count;
	dev->touch_cap_seq_count =
		buffers_since_start + dev->touch_cap_seq_offset;
	dev->touch_cap_with_seq_wrap_count =
		dev->touch_cap_seq_count - dev->touch_cap_seq_start;

	vivid_thread_tch_cap_tick(dev, dropped_bufs);

	numerators_since_start = ++buffers_since_start * numerator;

	now = hrtimer_cb_get_time(hrtimer);
	time_since_start =
		ktime_to_ns(now) - ktime_to_ns(dev->time_touch_cap);

	// printk("time_since_start = %lld\n",time_since_start);
	mutex_unlock(&dev->mutex);

	next_time_buf_start =
		time_since_start / buffers_since_start;

	// printk("next_time_buf_start = %lld", next_time_buf_start);

	hrtimer_forward_now(hrtimer, ns_to_ktime(next_time_buf_start));
	return HRTIMER_RESTART;
}

References:
 - https://github.com/Scott31393/linux/commit/b0e7b7eea1921ab3faad46c8ad8538c083cac2b4

During test I got the following result, delta is quite costant but
sometimes I got some delay of 2 time the, let me say "nice to have
delay". 

/usr/bin/v4l2-ctl -d /dev/v4l-touch0 --stream-mmap --verbose

cap dqbuf: 1 seq:   3839 bytesused: 504 ts: 628.527612 delta: 99.995 ms fps: 10.00 (ts-monotonic, ts-src-eof)
TD16:    0   1   0   0   0   0   0   0   0   0   0   0  -3  -1   0   0   0   0   0   0   0
TD16:    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   1   0
TD16:    0   3   0   0   0   0   0   0   0   0   0   0   0   0   3   0   0   0   0   0   0
TD16:    0   0   0   1   0   0   0   0   0   0   0   0   3   0   0   0   0   0   0  -1   0
TD16:    0   0   0   0  -1   0   0   0   0   2   0   0   0   0   0   0   0   0   0   0   0
TD16:    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
TD16:    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
TD16:    0   0   0   0   0   0   0   0   0   0   1   0   0   0   0   0   0   0   0   0   0
TD16:    0   0   0   0   0   0   0   0   0   0   0   0   0   3   0   2   0   0   0   0   0
TD16:    3   0  -1   0   0   0   0   0   0   0   0   0   0   0   0   0   3   0   0   3   0
TD16:    0   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
TD16:    0   0   0   0   0   0   0   3   0   0   0   0   0   0   0   0   0   0   0   0   3
cap dqbuf: 2 seq:   3840 bytesused: 504 ts: 628.627602 delta: 99.990 ms fps: 10.00 (ts-monotonic, ts-src-eof)
TD16:    0   0   0   0   0   0   0   0   0   0   0   1   0   0   0   0   0   0   2   0   0
TD16:    0   0   0   0   0   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0
TD16:    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   3   0   0   0
TD16:    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
TD16:    0  -2   0   2   0   0   0   0   0   0   0   0   0   0   2   0   0   0   0   0   0
TD16:    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
TD16:    0   0   0   0   0   2   0   0   0   0   0   3   0   0   0   0   0   0   0   0   0
TD16:    0   0   0  -2   0   0   0  -3   0   0   0  -1   0   0   0   1   0   0   0   0   0
TD16:   -1   0   0   0   0   0   0   0   0   0   0   0   0   0   0  -3   0   0   0   0   0
TD16:    0   3   0  -3   1   0   0  -3   0   0   0   0   0   0   0   0   0   0   0   0   0
TD16:    1   0   0   0   0   0   0  -3   0   0   0   0   0   0   0   0   0   0   0   0   3
TD16:    0   1   0   0   0   2   0   0   0   0   0   0   0   0  -1   0   0   0   0   0   0
cap dqbuf: 3 seq:   3841 bytesused: 504 ts: 628.727597 delta: 99.995 ms fps: 10.00 (ts-monotonic, ts-src-eof)
TD16:    0   1   0   0  -1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
TD16:    0   0   0   0   0   0   0   0   0  -1   0  -1  -3   0   0  -1   0   0  -3   0   0
TD16:    0   0   0   0  -1   3   0   0   0   0   0   0   0  -1   0   0   0   0  -2   0   0
TD16:    0   0   0  -1   0   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0
TD16:    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0  -2   0   0   0   0   0
TD16:    0   0   0   0   0   0   2   0   0   0   2   0   0   0   0   0   0   0   0   0   0
TD16:    0   0   0   0   0  -3   0   0   0   0   1   0   0   0   0   0   0  -3   0   0   0
TD16:    0   0   0   0   0   0   0   0   0  -2   0   0   0   0   3   0  -3   0   0   0   0
TD16:    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0  -2   0   0
TD16:    0   0   0   0   0   0   0   0  -1   0   3   0   0   0   0   2   0   0   0   1   0
TD16:    0   0   0   0   0   0   0   0  -1   0   0   0   0   0  -1   0   0   0   0   0   0
TD16:    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
cap dqbuf: 0 seq:   3843 bytesused: 504 ts: 628.927577 delta: 199.980 ms fps: 10.00 dropped: 1 (ts-monotonic, ts-src-eof)

This is just a work in progress. For this reason I don't post the entire patch.
But if we need I can post it too :)

Let me know. What do you think about.
Thanks in advance.

Tommaso
-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
