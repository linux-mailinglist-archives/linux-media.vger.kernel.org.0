Return-Path: <linux-media+bounces-32409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF6AAB5827
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 17:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19C023A7E06
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 15:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546712BCF6D;
	Tue, 13 May 2025 15:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="NIMtKrE7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373A0482F2
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 15:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747149081; cv=none; b=i7C1rKK3Wku3guEKfGtiRrDAg2BA3xwI+HRLXZSVmvhzu6dx3Erkeq0+96xPolNDwALYyn0h3RYaEvx+Bflvc1xygstntIw75cp8brQS8FFz2i0LwkLEfePeVVTf4AhsXTMyq8nvoo3jjyhKqohX0gD0sKY0ElgkTO2VvfrunXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747149081; c=relaxed/simple;
	bh=vSuPr7ri2jzEwCjhbZAQ66WU4exRsQXK236Tp2UMrTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkZR32eMgvSKdr9p7REFWuJJC/v1QV6zIBgfx1ro96O2fdrd5aq43gnhyO5Nz2d1hm3LHSaBCrohNcAHQURMa0+1cnmDRr+SiJi42kPBr7kz8JtrOSM/CSA0NcLNywill5IsPn4Bz5/7XdgUZZ2Q19GfsR0A04psgeuAW9k2eJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=NIMtKrE7; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so72411456d6.1
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 08:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1747149079; x=1747753879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vcA3Z4jzMIZZtYMJRiF5ZNA7Jc6yPVtKd63c9eBjQkY=;
        b=NIMtKrE7ErXO/DxGs0OJbDz/ob0eD9w7H/g4n6XXbbw7kvx3Ck8UQ9uKVLPPf0H/la
         M2ylvtvbB6Vhpn8/kmdR7R099XFlOpw9LKlsgNRYnE73VmEsGif8lc/YYYNGgnMpJ8c8
         sk6KKrxYk36p41GNyNFPv99xwVwizPIMFeeaAgkC4KGTzU7u+lh2AFL/ahEMU8ehDvj0
         conupw7tuesHfnXT29WTu0+dTf2sl8Bs7Kkw7CFktcM1T3pWTOVUrKjgfmeOGVBQd9ir
         gZhHfi/UKnqRfPV/ctpBnhboSWA0FO/v4LoajKnXdbD34E7H8sm9Fc9aGkeM0rmiirXz
         VAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747149079; x=1747753879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcA3Z4jzMIZZtYMJRiF5ZNA7Jc6yPVtKd63c9eBjQkY=;
        b=e/KZ7oqpu7vvI8PyY3zwR9kYymJ43lvmlWE6IimxqWNMSDzUhyVRkOSLj2UXsDVMpG
         9lqKA5/dgoCgQiiTtb0CPnkhLus4k9E1ikUnUhQ4V3qGyDr3kftOa/e+WR/xuYgntZ3d
         T45mzziVSVvJomVqiolJqWGrDi/4m74Nt4JtgWAUMIr3KjIsNGIjDOzgGK4s9w25z2Tx
         YK2xtRL9bIhwibx3jd7DlkGlKo93xVU2Dmwvh1coGcIt/mir8/8Dl7XzEXBkl9riPDgB
         1ZL98dyLsp0LuMmZvp2okeBuuFuHv3hpOWYUsyISG0uvRZj0bvrqc2f2QvfsPOSNKX3y
         uVmA==
X-Forwarded-Encrypted: i=1; AJvYcCUU2QvQZX14297snTQfpcQgtzzkGdPkab99w041Jy214/dIyTCgFEWzBIWkyOJetJgmzMrol05nCRKLsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHclBORJ9b1nPxHP4OYx07aAfGaBjaX2jIbjO6MJsP5ZgEjNYr
	ZzV8VCAi2GujBBLQsQBdThhpmRn8AGzP4NJldUYQqch9ZGP20FDxOIzttWpT/rqUuDnJByQk6wY
	=
X-Gm-Gg: ASbGnctIoNCYlM1LZo02cwim2+FlxTz8TZNMEWBoTok4d9kt9loPBGQXWy+xC/nIZdP
	FSE1Rqnw68lv7jSUuwsZCAh5bK1JuDVSJuQ4T87puj+0s5JTTcSJ/L72auHr+bDU1qMKynOD3fm
	N5SkRmeaLz2R7h+4CI8NsOsUHSdcqAm2BPRoyIw+1UldRBhvEG/+quw+Z+iWrOh2IHBAU6ePPvD
	YUyGnS9An15Vk06r0sIdstn2pfO/tBxU6bjQZC09Hc4mfEPJ4/UeqiEVUSQk+JXT6eljS1t/Vf8
	uLh6aL533C6wia43lYva0MeUwskjM8fLGuegGkqojaBgymYQIQoAlS0YBlwWgnpp8D9g8A==
X-Google-Smtp-Source: AGHT+IFE+sCALMsVuAzcyi0CFJEyC2jHv15dAG6xqL5vQvflSMq1MuCrXdzeM+nxcj1DyxaL/2CcbQ==
X-Received: by 2002:ad4:5d63:0:b0:6f4:cb2e:25ca with SMTP id 6a1803df08f44-6f6e4800ddemr310098676d6.27.1747149078868;
        Tue, 13 May 2025 08:11:18 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6eb393f0esm51659016d6.33.2025.05.13.08.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:11:18 -0700 (PDT)
Date: Tue, 13 May 2025 11:11:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+99d6c66dbbc484f50e1c@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, hdanton@sina.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org, mchehab@kernel.org, paskripkin@gmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] [media?] KASAN: use-after-free Read in
 em28xx_init_extension (2)
Message-ID: <ab7652b5-f854-4221-99a3-1c5b192b29ff@rowland.harvard.edu>
References: <000000000000453f3d05db72fc7e@google.com>
 <68235ee9.050a0220.f2294.09fc.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68235ee9.050a0220.f2294.09fc.GAE@google.com>

On Tue, May 13, 2025 at 08:02:01AM -0700, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit a368ecde8a5055b627749b09c6218ef793043e47
> Author: Alan Stern <stern@rowland.harvard.edu>
> Date:   Thu Jun 27 19:56:18 2024 +0000
> 
>     USB: core: Fix duplicate endpoint bug by clearing reserved bits in the descriptor
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12cf6cd4580000
> start commit:   cd802e7e5f1e Merge tag 'for-linus' of git://git.kernel.org..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=11cf6cd4580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=16cf6cd4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=91c351a0f6229e67
> dashboard link: https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=143a7768580000
> 
> Reported-by: syzbot+99d6c66dbbc484f50e1c@syzkaller.appspotmail.com
> Fixes: a368ecde8a50 ("USB: core: Fix duplicate endpoint bug by clearing reserved bits in the descriptor")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Clearly a ridiculous claim.  Maybe the bug fixed by that commit covered 
up the actual cause of this problem.

Alan Stern

