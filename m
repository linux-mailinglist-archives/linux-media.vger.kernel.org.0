Return-Path: <linux-media+bounces-41766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D276EB43995
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 13:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC0375A1881
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 11:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC692FDC4C;
	Thu,  4 Sep 2025 11:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JK5MzDxu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B2B2FD7A8;
	Thu,  4 Sep 2025 11:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756984072; cv=none; b=hzHpHEsvhs4sDUAciBzPfZoDZbxmcEdmqBO2jygXMeoKN8APHUcxls/0aSTEHRwhIfkjZOjMfLpdr/tp8NC6PwwldB63+hZSmFnULWncFgY/favagqlmjCa3grpIjVddw0mua2bAVaBjPFNr6Gjl9FxTBFVzAe8zyCfK1ebnFeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756984072; c=relaxed/simple;
	bh=o5B5gzOnwYTZIcXzLguqMfCZPuBjfDzCq/kZ0Iz7dRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqLtYBu4qjFX7W2HcIXlDAqBCZ+r1NVpww/XEOsYbRxp8Tqu09HK8j19PRJQbaGP9FW9gYctSg6ZlotWvDg1IcPv5JjvS7cHS2ONiYs+hCqdw6oC5IR3u1xzyTjbjPWoFGTHkeJ+9YejUckr6/OvJKal58nxt3EJQOvxgqD7cDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JK5MzDxu; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24af8cd99ddso12364445ad.0;
        Thu, 04 Sep 2025 04:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756984070; x=1757588870; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aWcJcuU5m8E8NWZfi3gesvIfCQgrkx26//olh7X5D18=;
        b=JK5MzDxuJUkiJunG9AszSsu5XilPiGdolETDR/sv3Utr18ovxfPlmJMj0IamDTsiRU
         oEgrJ9QkTQxzTp7lXMd6dHcQ0cCRedRcjtTsDqzEKHtqgqKEqzZrOp0lFDyNCxp21wzl
         ubKMrlWBtKGZKjh7okk9C6/ir5cYmp1jWYv6teYpu9L5WrsS7vaawOJJGvweo+hyFcdC
         VYvQr5apBJjDnznTXnrxcbGlj+xk9yv9XkG8BNeIcGmyoiVRlh/I+2yFpvz32nclEcSq
         mEXtOs3zWxgT9GtDwkN8Pui9ximUD5DlQO6bHEcqf411/tg6tpf6r9pEQBQQjNhMHoEO
         Sn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756984070; x=1757588870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWcJcuU5m8E8NWZfi3gesvIfCQgrkx26//olh7X5D18=;
        b=JDW/acG8KuXDOwaOCR45YbZSuOS3LsgxrIcD8t1u9FvEDkh/oeigVSJ2IKcgjJXQ0R
         JOdGzADf0xTfLfxhxG5PbovQvV+lUtp+PwWUIhatAo6Nk2mz5ZfSPMulWIfJvgIFaZ3F
         iVmkm6NSjpBFxjPKg0NxRkht4KdqjlBqmB9DCuwDp5Knx7wbsO53wLGTAFunyEhcg3yJ
         CGnSBAKi7WU8bnpSsAlX5xgF/VpN2ACAkZfaqBznd5Lz41N2RsETEcFrVLlj3/Tt2j4m
         qwFdgNP2ms/WPzCDw6kQanKI3DtVEU3dAuaPnzcFQ0k2aAGeW8bH8T1QNIqGse5Mp+gd
         rZ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqyXl46zTPlySr88IFvDA4akt2SGhObt87f4E4KQKoQrx0noSjJwFEfTykeeQh67VmlEBOVBwGSdJzkME=@vger.kernel.org, AJvYcCXsYhvzaqP2nU1Kp0vactWSZgi6Vugs4I5oUmRm9ahmpvVqRBbRFe56VAhcxvmKeoCqbUa25WUkh//bMKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPG1MsdqNPbuY6pneVWlasuWaUHnYA8u3JdeFPEJcFRGX8Me+x
	nHGvYEE0BUSlRZ9rpx3HN8ylt+knsL+jedOFlieHnu/Ze7sLUwQxVHHLey86S3/to0hFPzrx/WT
	isoPRgxreHmaJi3+qcNpWEuqx1sW4YbY=
X-Gm-Gg: ASbGnctytkKvG83DYzpzeMwTmtdwoSIPnK1lszhaRHESh6UWuQVhWtDFli1ymj4FAlK
	jGxDICZs61r83Cn8yzHyeCahtPNGcMBL4+WwS+ebays6uf1cKznWFu0jz8C1NI23JyRBURYs3kC
	GpxQOy9MF6UsJbVBcuwW8hhZMFyLnicdRhoEuzuN5h6UbWPnwoxt9dBXLYJrAgx0k49gNsPO1es
	PmujkCO4Q==
X-Google-Smtp-Source: AGHT+IGVcUcX3Vb+uWYY+HBbuVXsJ0s2roZLdMippGXzgazgVvpHrllSksg2B/4gcKL/s2bIGkXFO+teiAdPdMDAwIU=
X-Received: by 2002:a17:902:e749:b0:24b:15b3:223d with SMTP id
 d9443c01a7336-24b15b34ad6mr116813115ad.16.1756984070349; Thu, 04 Sep 2025
 04:07:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421105555.34984-1-aha310510@gmail.com> <c4cf17bb-73cb-4e3b-9e61-8fd682b5e9ee@kernel.org>
In-Reply-To: <c4cf17bb-73cb-4e3b-9e61-8fd682b5e9ee@kernel.org>
From: Jeongjun Park <aha310510@gmail.com>
Date: Thu, 4 Sep 2025 20:07:44 +0900
X-Gm-Features: Ac12FXzPTV5VnDw5K5dn7toPL-rb9Lz__SqaDnPMxrmtXjKGs6gIRbc8xyk6zLM
Message-ID: <CAO9qdTHJ9GrbqjtMKzgDhy+bvEmDc+Sn3VosYxuq5hJ9Z20-bA@mail.gmail.com>
Subject: Re: [PATCH] media: az6007: fix out-of-bounds in az6007_i2c_xfer()
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, zhang_shurong@foxmail.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans,

Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>
> Hi Jeongjun,
>
> On 21/04/2025 12:55, Jeongjun Park wrote:
> > According to the previous commit 1047f9343011 ("media: az6007:
> > Fix null-ptr-deref in az6007_i2c_xfer()"), msgs[i].len is user-controlled.
>
> Does this relate to syzbot reports? If so, please add a reference to that.
>
> As far as I can tell, you can get here only through /dev/i2c-X devices.
>

Sorry, I seem to have forgotten to include the reported-by tag when
sending the email. I'll add it in the next patch.


> >
> > In the previous commit, bounds checking was added because a null-ptr-deref
> > bug occurs when msgs[i].buf and msgs[i].len are set to null. However, this
> > leads to an out-of-bounds vuln for st->data when msgs[i].len is set to a
> > large value.
> >
> > Therefore, code to check the maximum value of msgs[i].len needs to be added.
> >
> > Fixes: 1047f9343011 ("media: az6007: Fix null-ptr-deref in az6007_i2c_xfer()")
> > Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> > ---
> >  drivers/media/usb/dvb-usb-v2/az6007.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
> > index 65ef045b74ca..fba1b6c08dc7 100644
> > --- a/drivers/media/usb/dvb-usb-v2/az6007.c
> > +++ b/drivers/media/usb/dvb-usb-v2/az6007.c
> > @@ -788,7 +788,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
> >                       if (az6007_xfer_debug)
> >                               printk(KERN_DEBUG "az6007: I2C W addr=0x%x len=%d\n",
> >                                      addr, msgs[i].len);
> > -                     if (msgs[i].len < 1) {
> > +                     if (msgs[i].len < 1 || msgs[i].len + 1 > sizeof(st->data)) {
> >                               ret = -EIO;
> >                               goto err;
> >                       }
> > @@ -806,7 +806,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
> >                       if (az6007_xfer_debug)
> >                               printk(KERN_DEBUG "az6007: I2C R addr=0x%x len=%d\n",
> >                                      addr, msgs[i].len);
> > -                     if (msgs[i].len < 1) {
> > +                     if (msgs[i].len < 1 || msgs[i].len + 5 > sizeof(st->data)) {
> >                               ret = -EIO;
> >                               goto err;
> >                       }
>
> I feel uncomfortable about this patch and similar patches that attempt to address this
> in various other drivers as well.
>
> It's all rather ad-hoc. E.g. you fix the two places here, but not the case at line 778.
>
> I think the proper fix would be to modify __az6007_read/write and add an argument with the
> size of the buffer, then let that function do the check. Rather than manually doing this
> check at every call of those functions. Same for similar drivers.
>
> The approach taken in this patch is too fragile.
>

You're right. Looking at it again, it seems more appropriate to fix
__az6007_read/write.

https://lore.kernel.org/all/20250421125244.85640-1-aha310510@gmail.com/

I remember patching vulnerabilities I found in other drivers using the
method Hans suggested. Is this the correct way to patch them?

> Regards,
>
>         Hans
>
>
> > --
> >
>

Regards,
Jeongjun Park

