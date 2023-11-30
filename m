Return-Path: <linux-media+bounces-1417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7396C7FF1B8
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 15:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D1EB281E91
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 14:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3833151001;
	Thu, 30 Nov 2023 14:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="d/h4gpa9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D7785
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 06:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=/X8jazQUvZoCEMtE1HqE56485lMCZyLGm9Hi7ZQPL/Y=; b=d/h4gpa9bECc+eOAJ4byl1LN+J
	zrzwxDiNTTB3XhhpygxRRUZwSd5Tn0QEFtBGKWI714Xnb4AB/BqB9ZxKb+cWXZXBhn51b6XQlcx7P
	gsE/ZzHKDHc7bzulVcKHjeIRtIuCD29b8Kcurj1RzQJcPd9zN6ReBnTfq+INvfl+fNwqNe5+3GDBo
	QSznctUG9W6Q03hG3NrZqgaf947e/HZJe7saYplFCR6v8TAWX9CcNv2VSA4Hh98ZV6EiICuDY+01c
	4Q1lWDccn8lwwJCerIXe/uznItsa+AzLRWNPp7Wl8lUgzydLmdNS3/bJiSvsthwa6YhsWtrVvXadI
	0TJJgXfg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1r8hzY-00Bas2-0W;
	Thu, 30 Nov 2023 14:26:12 +0000
Date: Thu, 30 Nov 2023 14:26:12 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: Re: [PATCH 0/3] media: bttv: three post-vb2 fixes
Message-ID: <ZWibhE350L3BTRK8@gallifrey>
References: <cover.1701349092.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <cover.1701349092.git.hverkuil-cisco@xs4all.nl>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-12-amd64 (x86_64)
X-Uptime: 14:26:03 up 75 days, 17:24,  1 user,  load average: 0.23, 0.11, 0.04
User-Agent: Mutt/2.2.12 (2023-09-09)

* Hans Verkuil (hverkuil-cisco@xs4all.nl) wrote:
> Dave, thank you for your detailed bttv bug report:
> 
> https://lore.kernel.org/linux-media/ZVK_3UmvmOaCv1tc@gallifrey/
> 
> It was very helpful and I managed to reproduce these issues.
> 
> This patch series fixes them.
> 
> The first patch is unrelated, just something I noticed while
> debugging this.
> 
> The second patch adds back the old bttv behavior of storing the
> frame counter in the last 4 bytes of the vbi payload when using
> read().
> 
> The final patch fixes the vbi read() behavior where it was
> alternating between valid data and a zeroed buffer.
> 
> I'd appreciate it if you can test this before Dec 11 since I
> plan to merge on Dec 11 if I don't hear anything.

Sure, I'll get on it.

Dave

> Regards,
> 
> 	Hans
> 
> Hans Verkuil (3):
>   media: bttv: start_streaming should return a proper error code
>   media: bttv: add back vbi hack
>   media: videobuf2: request more buffers for vb2_read
> 
>  .../media/common/videobuf2/videobuf2-core.c   |  9 +++++--
>  drivers/media/pci/bt8xx/bttv-driver.c         | 27 ++++++++++++++++---
>  drivers/media/pci/bt8xx/bttv-vbi.c            |  8 +++---
>  3 files changed, 33 insertions(+), 11 deletions(-)
> 
> -- 
> 2.42.0
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

