Return-Path: <linux-media+bounces-10525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 301708B8793
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 11:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C1711F21560
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 09:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CDC50A66;
	Wed,  1 May 2024 09:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dq1ajWzb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825C4502B1
	for <linux-media@vger.kernel.org>; Wed,  1 May 2024 09:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714555366; cv=none; b=pk9GH//pKb4o3McHSXwDFBdfyJty6qrCxzXNEBFH+pWlxo4Gmj1TmRUixRAe/3ID5D6qVr8iRyw3AqTP0/g6T8Bub7yH8NEtXQRmzOmLnewbrFWvdNmx3NheAqPiMJtylg1tc1F4lA7bQVAKsywoDSmRSVPNQ/iA3Ae7hQWKV3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714555366; c=relaxed/simple;
	bh=h454Qj5KhLSCbGhQvCNTcfUV1kbjFSC6wSOJxY/M/CE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvS6W6pffnLuphq//2hcazIa5G0iv9zl6/dD46tEeTfN/i9CIk/+5h6AhuwjGoJFt2Kf5MesXk65E6RhJrhksQhiMUwxRFr+2mhvy/lo0ZKsr5grWA1EmJEDJmFMS2RM1b4KTiJ4El88ceaILKr3U4xaGvl9+iSfYY9ftUqmeZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dq1ajWzb; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6a0c8fb3540so5916786d6.1
        for <linux-media@vger.kernel.org>; Wed, 01 May 2024 02:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714555363; x=1715160163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8HAWxGiDH4jeEhVPnilAd/2cv2d7GxBiD11a90klzw=;
        b=dq1ajWzb1Hxw6NskVOJ2+82wWQLDD6ipFaEzg6/g6tA1zpHV4tNmRZUimhyqYHHmD4
         iIYuB083zfVJ+BdnnL864R1YENsEAd8tG5xM9WfMUXh2Xvgr+cGrwPpQhGOy3RPvdVql
         dwO7q4YaCOGIZfpY9jW1NR9SjWjRIn7qy53Fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714555363; x=1715160163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8HAWxGiDH4jeEhVPnilAd/2cv2d7GxBiD11a90klzw=;
        b=r6GL0dEmhm/y7+N6LHC59pUuH7djqOu6qwON886y6ybCc2vCNi+r2QHu0DVqfz2E7I
         pZ0HK9XkSsF+RW58UargO72WmhjvVN4EJ+oKOyQxzF+yC7kIgUun2eHNy4nfq6A1cq+V
         yHqxoYalM2B4IS/JIrcHdl5xI80PqRjXkjn+ddedETgBGXPS6HNtB31vAmrBDdkBdWmW
         OAhmsm+BQPQ6yHhGsG7erWCoheP0Q7OeLdLdq6eFyQK06NMnfEpq9vvig4Nh1+l2hCY8
         dPOozTSV3JqKnHYF36Kl28Or118FCZp6Q5XSSmF2u4D+iUhnMC+DX1m5txob+SlJUzn/
         RN9w==
X-Forwarded-Encrypted: i=1; AJvYcCWvBmpmE4uNSjJ9gwPjq4LBBMiy4+p1G6ZJ0rugDvWYR4zXLKsve1Prq0L6lX+kxDrT0DPxSHmqO53+BJ8yyo5sZpi2JZH6cUmTyXU=
X-Gm-Message-State: AOJu0YwdlQsKXHa4D0KHBwvdSeSvhHqRLQbmVgERuqIClMd7EgdxMfe+
	jYYSzNe4j751cJ4xf3PIHoya6dxgKystt95UUYPjd9KfCxCVrQdmqE60X8r65BRP6Vm3QwOgVVZ
	TkQ==
X-Google-Smtp-Source: AGHT+IHDo0JL0JyM5f085Sf6jbx9eJH7PozVV5bUVV/Xc9e/0J2YnMZlgd4zgkIevxflUc9m7BZ45w==
X-Received: by 2002:a05:6214:1311:b0:6a0:eb86:f5e with SMTP id pn17-20020a056214131100b006a0eb860f5emr3738599qvb.17.1714555363281;
        Wed, 01 May 2024 02:22:43 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id v3-20020ad45343000000b006a0404ce6afsm5880184qvs.140.2024.05.01.02.22.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 02:22:42 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-78f02298dc6so58462185a.1
        for <linux-media@vger.kernel.org>; Wed, 01 May 2024 02:22:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXbVCCl2oJmOvzZwd74ACDz4Nnv9tiVZNmAVF8jmfTawRjbX1X1hOHSB68B7dzhbBVh7sxpyakx4y43khb+moCrisE9dmy4VWeQHR0=
X-Received: by 2002:a05:620a:2685:b0:790:76ea:b47c with SMTP id
 c5-20020a05620a268500b0079076eab47cmr8101133qkp.24.1714555362327; Wed, 01 May
 2024 02:22:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430-fix-ipu6-v1-0-9b31fbbce6e4@chromium.org>
 <20240430-fix-ipu6-v1-2-9b31fbbce6e4@chromium.org> <42svo2ykapj3atpds3dedqzybp4vh7vcvje622n4cxz6geaw2w@mfazrgyw6653>
In-Reply-To: <42svo2ykapj3atpds3dedqzybp4vh7vcvje622n4cxz6geaw2w@mfazrgyw6653>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 1 May 2024 11:22:26 +0200
X-Gmail-Original-Message-ID: <CANiDSCsJvTV81H_jUWufFGp0TqE7u9t=6MKO8BU294aanomm-Q@mail.gmail.com>
Message-ID: <CANiDSCsJvTV81H_jUWufFGp0TqE7u9t=6MKO8BU294aanomm-Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] media: intel/ipu6: Switch to RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS
To: Hidenori Kobayashi <hidenorik@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 1 May 2024 at 11:20, Hidenori Kobayashi <hidenorik@chromium.org> wr=
ote:
>
> On Tue, Apr 30, 2024 at 12:55:34PM +0000, Ricardo Ribalda wrote:
> > Replace the old helpers with its modern alternative.
> > Now we do not need to set '__maybe_unused' annotations when we are not
> > enabling the PM configurations.
> >
> > Fixes:
> > drivers/media/pci/intel/ipu6/ipu6.c:841:12: warning: =E2=80=98ipu6_runt=
ime_resume=E2=80=99 defined but not used [-Wunused-function]
> > drivers/media/pci/intel/ipu6/ipu6.c:806:12: warning: =E2=80=98ipu6_resu=
me=E2=80=99 defined but not used [-Wunused-function]
> > drivers/media/pci/intel/ipu6/ipu6.c:801:12: warning: =E2=80=98ipu6_susp=
end=E2=80=99 defined but not used [-Wunused-function]
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/in=
tel/ipu6/ipu6.c
> > index 4b1f69d14d71..ff5ca0c52781 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> > @@ -803,7 +803,7 @@ static int ipu6_suspend(struct device *dev)
> >       return 0;
> >  }
> >
> > -static int ipu6_resume(struct device *dev)
> > +static int __maybe_unused ipu6_resume(struct device *dev)
>
> Doesn't this contradict your commit message?
Ups, good catch!

I started by adding __maybe_unused everywhere and then decided to use
a different macro. Will upload a new revision later today.

>
> >  {
> >       struct pci_dev *pdev =3D to_pci_dev(dev);
> >       struct ipu6_device *isp =3D pci_get_drvdata(pdev);
> > @@ -860,8 +860,8 @@ static int ipu6_runtime_resume(struct device *dev)
> >  }
> >
> >  static const struct dev_pm_ops ipu6_pm_ops =3D {
> > -     SET_SYSTEM_SLEEP_PM_OPS(&ipu6_suspend, &ipu6_resume)
> > -     SET_RUNTIME_PM_OPS(&ipu6_suspend, &ipu6_runtime_resume, NULL)
> > +     SYSTEM_SLEEP_PM_OPS(&ipu6_suspend, &ipu6_resume)
> > +     RUNTIME_PM_OPS(&ipu6_suspend, &ipu6_runtime_resume, NULL)
> >  };
> >
> >  MODULE_DEVICE_TABLE(pci, ipu6_pci_tbl);
> >
> > --
> > 2.44.0.769.g3c40516874-goog
> >
> >



--=20
Ricardo Ribalda

