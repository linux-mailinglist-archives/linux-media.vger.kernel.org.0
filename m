Return-Path: <linux-media+bounces-13151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F20906450
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 08:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A180284FD9
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 06:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43598137924;
	Thu, 13 Jun 2024 06:46:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881542119
	for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 06:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718261164; cv=none; b=LDfKeZhpiKFXIvFl7sig8VBeYS0xDfSvQpMNBks+hhBr3SCMqRu+uZFJArplDkSxMpjejKOpaJb51wSsTJvfdyFEWHdR7lPUGgI7kgEKHC8m+VVoMqeOvyd6vUNWUU1m/tYNMjjTVQOjJ4A+rlgTEYmV6BV7+ENOcx5NC/lLHtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718261164; c=relaxed/simple;
	bh=32IH8KSlXm2ko3meyXugpk3LSb+VUtidUqO+72/WiBo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ih1n0QGWpUwcEAmctLGVoJrjm0AhFkZqktTR/UyNigYsi5Xzq5/7ERX073coxJV31LV+b6NR6eFlye/SyrlHz3GZTsXD1wR0Ryh0/xXD8gf1pgG+QOjGSrCV4N32H+ihBT5GGD1RT3M/s0eqo9Qe2pj7BNITzCaYyLS6I4nI9f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7e8e2ea7b4bso64047739f.0
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 23:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718261163; x=1718865963;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2xgF8ibcEaldCk43yXegeJSCV4DTuCuF5ATotbVCUuQ=;
        b=L6IFz6KL3eRPxpbm5SMXev2ruxahkc0HDBv0pt0EtVz7Ay8rEXbfDQ+luClWAjHK9B
         nnXD6XLBN8/hXJNz2P5TpHcAIyHXvkJgevTj67DCXsUsOKdmhD/4hXCkAyCUsQSce/VA
         YheTjl5Ozqgf3J8lzJEkHFHgU5TtjRg89NOKQpB/LvRCBSnbwB/IPjAJw244Tz3iDnqW
         SM+4QUKbC1pQ/SABw4121N7mXUMR5fBE2wLuQYI4MKYlyjI0kXKbJeuuLkSjQufuDmfo
         rmFvOgPu3IrYwA9CBCLyrHjMor1Pu+dUkGKKpsf2qHDHSM+H5K3TD6hQ3tQomqYC/K52
         KzLA==
X-Forwarded-Encrypted: i=1; AJvYcCWKvilIDMdLEZBGGImslriidWE7HQyTd5s63JAHbsPZ3jY3Wg6T8ncusthNruwCAVtC6YK9W/nn+09iW2Ok3cgBg1MtFiGMWL05Dr4=
X-Gm-Message-State: AOJu0YwZFIr37M0IlLlt4DZH8pOq0mVFssueO7O3nIFpCwTLQSF5Ig+f
	UODlZYqo5qRaKMh/h3ji03fe8xffnJ0MZMgJrGbA7qVljn0GDizI73Hfhnu6z617EGsSYuusPdM
	72Z69GLfT3NaNODbcf6WObK6IfGo9Q87S0r+PokY4Fi+74Z3BrGMIx+k=
X-Google-Smtp-Source: AGHT+IHVV4ammGC2f4+AGyBTE1+VDmo87HUmoApb8C4WDpycZnv406L1ZJ6bIafm6AgJf15GrH+StIi7CY1fsJAsDhp7cO8L/eZo
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:641f:b0:7eb:9f62:3370 with SMTP id
 ca18e2360f4ac-7ebcd19eff6mr21065439f.4.1718261162696; Wed, 12 Jun 2024
 23:46:02 -0700 (PDT)
Date: Wed, 12 Jun 2024 23:46:02 -0700
In-Reply-To: <IA0PR11MB718550C7137E8341C7D54A71F8C12@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003bfa48061abfda41@google.com>
Subject: Re: [syzbot] [dri?] [media?] general protection fault in
 udmabuf_create (2)
From: syzbot <syzbot+40c7dad27267f61839d4@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	kraxel@redhat.com, linaro-mm-sig-bounces@lists.linaro.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	syzkaller-bugs@googlegroups.com, vivek.kasireddy@intel.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+40c7dad27267f61839d4@syzkaller.appspotmail.com

Tested on:

commit:         c7db1220 fixup! udmabuf: pin the pages using memfd_pin..
git tree:       https://gitlab.freedesktop.org/Vivek/drm-tip.git syzbot_fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=133a93e2980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=58a2adb83f90b327
dashboard link: https://syzkaller.appspot.com/bug?extid=40c7dad27267f61839d4
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

