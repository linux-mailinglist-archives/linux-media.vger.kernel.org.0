Return-Path: <linux-media+bounces-683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D447F387C
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 22:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2866282A9F
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 21:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37099584FC;
	Tue, 21 Nov 2023 21:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IUljsrzz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8317B110;
	Tue, 21 Nov 2023 13:45:37 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D0019CE;
	Tue, 21 Nov 2023 22:45:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700603104;
	bh=MpP8CV1iBMHLxuQWJsETis3k/Ho3yC5d0656Sw3fEh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IUljsrzzMjoGIPMnywfrgsx7LOi3Q7TUTNHUSeyz73+3J/iFlze5ZemIyYjHma6Ho
	 fMkNUPB7vH10psxXNqDlbaRiyHFxlCtLkZxqv5HQowXd+5PjS0ZLYAkesdfl9YPZSe
	 PyVtP7uq+sL2gpXwlj9rv0PlryVfb+SAf6A8RQ5U=
Date: Tue, 21 Nov 2023 23:45:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: syzbot <syzbot+0b0095300dfeb8a83dc8@syzkaller.appspotmail.com>
Cc: andreyknvl@google.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
	mchehab@kernel.org, nogikh@google.com, sakari.ailus@linux.intel.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] KASAN: use-after-free Read in
 __media_entity_remove_links
Message-ID: <20231121214541.GB3909@pendragon.ideasonboard.com>
References: <0000000000003ee3610599d20096@google.com>
 <0000000000002a1fec060ab0120c@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0000000000002a1fec060ab0120c@google.com>

On Tue, Nov 21, 2023 at 01:13:15PM -0800, syzbot wrote:
> This bug is marked as fixed by commit:
> media: uvcvideo: Avoid cyclic entity chains due to malformed USB descriptors
> 
> But I can't find it in the tested trees[1] for more than 90 days.
> Is it a correct commit? Please update it by replying:
> 
> #syz fix: exact-commit-title

What logic does syzbot use to try and find the commit upstream ? There's
a commit with the exact same subject, what was missing to find it
automatically ?

> Until then the bug is still considered open and new crashes with
> the same signature are ignored.
> 
> Kernel: Linux
> Dashboard link: https://syzkaller.appspot.com/bug?extid=0b0095300dfeb8a83dc8
> 
> ---
> [1] I expect the commit to be present in:
> 
> 1. for-kernelci branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
> 
> 2. master branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
> 
> 3. master branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git
> 
> 4. main branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
> 
> The full list of 9 trees can be found at
> https://syzkaller.appspot.com/upstream/repos

-- 
Regards,

Laurent Pinchart

