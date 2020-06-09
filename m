Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00EDF1F33FC
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 08:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbgFIGQ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jun 2020 02:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgFIGQ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jun 2020 02:16:26 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFAE3C03E969
        for <linux-media@vger.kernel.org>; Mon,  8 Jun 2020 23:16:25 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id n9so7638367plk.1
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2020 23:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uF7bq0V6RjrVCaK/AJZe6FRiE+PCLgN/thFvASg1TXM=;
        b=W0kX625YN45f5e5u0Ssa9xVuLTAZyelb0SXei0k1kiyKMm79Cs2727xXDN8z1Azkqf
         afqNykZfiRvo3G39TI0XOEuLY3aLsjsRiRS0oRRV7LlfBCY/w3W7PoAjThChmLtUi35E
         hC+sjqyblUPbv/4hYoKhktc9/r16br6rzEsyrtlWtSjLOBAfgzUwmBZqPw3JiVdV8G+y
         Do47uO45eZuiN4lllWAwmeoDowxcNrUVAWuTvdNZigLV2Ro1/KMQECcFBQYrWkO2z69t
         aJ0Ptq4PlZ14ziBGY5o7ngLO4jhbsLG/OLJeoIoGsIwkfVpYzOf/zaLjpFVR0tbRJOlu
         TMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uF7bq0V6RjrVCaK/AJZe6FRiE+PCLgN/thFvASg1TXM=;
        b=cQ1ivGeBD1AbZNRdnyGqkzfqruwpbo6ORZTa3k3yx9swuqySjlgyw0EBOBBwUump8S
         uCK+YuediYbhMFrXQhjsOupmz84nLlncRUfb7EIUS0XjC6KlH04pKgPWWMgni2V2fgdq
         tzXkK9pb4Hp5+1bRFELxm2K1Q4EV3zuwKG1BqvtsDfbwldO2M8eKSrrXfkz86VAOLj6p
         /OBVT26IZ+wirFZkcmqvCtXLL5XI2vWTJF4L9M3fF9+ZAa/yrwCJrb+BlAZ+4Cdz0OPD
         kukf4rDu6IvJD5E9BpIYUtxRhiD8FQLo7TY5HiovuMvjkFlGIM10xcMxRC127FASEUIU
         oIAw==
X-Gm-Message-State: AOAM532AhLlg+04DsYQSSIz61tOLZ/EOyPNwJwibkvNcgX3UZLkqQBFG
        V49F8/Fp4AbLqd8zGbwT498=
X-Google-Smtp-Source: ABdhPJybX2jlua70ckKOR2Q4/vxjQOTGuTgkYnhpkBXTN8+Dhp/P39r1/q0iwbR0H/2CxvioJzgSWw==
X-Received: by 2002:a17:90b:3004:: with SMTP id hg4mr3351531pjb.208.1591683385360;
        Mon, 08 Jun 2020 23:16:25 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id u1sm7389272pgf.28.2020.06.08.23.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 23:16:24 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date:   Tue, 9 Jun 2020 15:16:22 +0900
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] v4l2-utils: test cache_hints for MMAP queues
Message-ID: <20200609061622.GA7760@jagdpanzerIV.localdomain>
References: <20200604044752.107856-1-sergey.senozhatsky@gmail.com>
 <401fe6a5-542e-cc3c-8455-aa7c424122b8@xs4all.nl>
 <20200608110917.GA31444@jagdpanzerIV.localdomain>
 <aec2fc2e-9be8-0557-c9cc-789240857bc8@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aec2fc2e-9be8-0557-c9cc-789240857bc8@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/06/08 13:14), Hans Verkuil wrote:
> >> Currently it sets reqbufs.flags/crbufs.flags to 0, but you can just set it to
> >> V4L2_FLAG_MEMORY_NON_CONSISTENT instead and add the relevant tests.
> > 
> > Ah, OK, so no test for ->flags = 0 case.
> 
> Right.
> 
> I don't think explicitly testing for flags = 0 is useful (famous last words, I
> may have to eat them in the future :-) ).

OK, I should be doing something else for a living. That computer programming
thing is entirely too difficult for me.

I see some test failures after I integrated testCacheHints() into testReqBufs().

What does testCacheHints() do:

	q.init(node->g_type(), m);

	reqbufs.memory = q.g_memory();
	doioctl(node, VIDIOC_REQBUFS, &reqbufs);
	q.reqbufs(node);

	crbufs.memory = q.g_memory();
	doioctl(node, VIDIOC_CREATE_BUFS, &crbufs);
	q.reqbufs(node);

	q.create_bufs(node, 2, &fmt, 0);
	q.reqbufs(node);

One thing to notice here is that q.reqbufs() and q.create_bufs() use
q.g_memory() for ioctl() requests, the same function we use to set
reqbufs.memory and crbufs.memory. In other words, all ioctl() requests
always the same memory type.

Now, what does testReqBufs() is completely different.

	q.init(i, V4L2_MEMORY_DMABUF);

	for (m = V4L2_MEMORY_MMAP; m <= V4L2_MEMORY_DMABUF; m++) {
		reqbufs.memory = m;
		doioctl(node, VIDIOC_REQBUFS, &reqbufs);
		q.reqbufs(node);

		crbufs.memory = m;
		doioctl(node, VIDIOC_CREATE_BUFS, &crbufs);
		q.reqbufs(node);

		q.create_bufs(node, 2, &fmt, 0);
		q.reqbufs(node);
	}

Notice that we use `m' for reqbufs.memory and crbufs.memory, and q.g_memory()
for q.reqbufs() and q.create_bufs(). And the issue here is that `m' and
q.g_memory() are not the same. So we use different memory types all the
time (except when m == V4L2_MEMORY_DMABUF).

I sent a kernel patch which explains why does this cause problems on the
kernel side, this email should explain why we haven't seen any of them
before.

	-ss
