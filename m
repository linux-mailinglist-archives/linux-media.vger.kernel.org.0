Return-Path: <linux-media+bounces-22692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9959E51A2
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 10:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4B861881658
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3287C1D5173;
	Thu,  5 Dec 2024 09:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D4I7E9Zx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC7F1D432D
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 09:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733392007; cv=none; b=Rys5wQ8y6YK9RSq2mY/40y3jVrwZPaXfpC4Z/e7/9bOz+Sy0Wg4ldiaK7xwyQI4cdD5AAIseAVvg+GaOyH6B8yv8xrsVlyrYK8zT7Fh8jzOZFpY698asIMEbwNwhJyyuY2Gw1SrqduCYwKqnGPBdW1A4JazbszCNiiQttKuT1qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733392007; c=relaxed/simple;
	bh=S6gFj0sEDxaY84RAcM2LEzUgCFPbLYUhTDxahYvYOMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HlaK2BK9R6A3aZBa6DHhdv6YgZAnOrzXqs5rYFZZLyXQYRLAw9Dw+18B5i6V4RVXQHwongXPupqPjVCL63JcsDjtG4D5jKbwtmji31mBxQct+HoxkDeiBI+wtaY2Hete8PIx1ToQIQSVPrfcIF4p01aQszvZwaYi/9z1wWQuUsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D4I7E9Zx; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so511446a91.3
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 01:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733392005; x=1733996805; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7m3Dq8z2rUWLEtm8eGRzrr+g6ZpWLDf0n21wTy/cEfQ=;
        b=D4I7E9ZxHv65iLb22RPSlv5kKqX/bqnSaqDq+2ApLnpqCZTJ1hc3JI24SvO032dx3Q
         jwITK8+mjvQaMD02IsbT8UU6mtiK4bRKTxQ6Sg1HPB6H0r2I7UPy9Br6xHhMWG6IwIv8
         fGW2jTtMrhV9kgLtkvGrCSbL/1PSx70YaWgMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733392005; x=1733996805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7m3Dq8z2rUWLEtm8eGRzrr+g6ZpWLDf0n21wTy/cEfQ=;
        b=Cc9YS2SOiKhEoy32y7UxaLW1tFshMXKLBUxVO3+x9Qv2BqUiV3x9Vj0blFDYOlY34b
         sb0WghDUILz3SyrDXHQ19HJ0hwO8/z3VeM/nfdPwJqD3K4ipUCkLkOFtKltLje19lFHQ
         XKG7a0kWz21F1Yzctnv9Y0rz+4F2dP/ONSh84fLMOoXaZvgYaQ6mxYUN2zM7Jn07D2QJ
         3LhfoqO5zmBSjzuJPPLDDLDrH0xNDdDLYUBOaYwb1Jpxgi6dQakSlbSVGld4Sgt3NZRz
         fgK90UGSTm9HWDbrZP2XfKnuF+bRYcLHrIXiDD7r6/CNtiMIy+Cq5W7pZ1mS76J2RZwT
         Toaw==
X-Forwarded-Encrypted: i=1; AJvYcCWLBWdr1EzpitldRCzfQ9BZopvj9my0ysLv3cqYgzci9Hy6cC/jQrOaUeAPVsv4HnfDzTJj6Z4je596Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB8Kl9h0nDBPQefdy56R4NlSwSahKKxSLUMjGZEF1Egbse0VOG
	Jpz7Q4WsMWTIumZRJjsINEDpI3NMVsWjLaLBJxuCJ8Y7JwxCLNCSzdNFUn6RDcSrSVDjwHeuwkY
	=
X-Gm-Gg: ASbGncv1UingP5i3WeUjUGc/xbVUu4ehlXVslM+5ojsp1tEj7TvmpsLkIv7t08UMoSC
	NcdoZfEV0qM9kzxmzuSAteeDyeXtHOVuKJyaMq+CYmceO9JQLpTAbmCS4XYtl6DETDFlgZV62tA
	GsuW2tNjyi7wdmKVgQHgNiOYTpSJsJOkQk4DoBHpviVFW9B7BcGB6/2Oz8ResYOv/Ij9F1rZNLA
	p7TzDNCoILfephHeJ0uSwwHXzZ1QJks1NBov9ouyMlg29Pmf2LwqI5U33dYb6jVM8BY0o3GmFJg
	FIxzp2Uq1wZIEYjU
X-Google-Smtp-Source: AGHT+IFxtPiYM6Td+cNnapSNnts90MNxalMS8dtW+dS2gBcUL/gJufnazNlMqPZqQjdjrWbDlaH0Yw==
X-Received: by 2002:a17:90b:1b0a:b0:2ef:316b:53fe with SMTP id 98e67ed59e1d1-2ef316b61f7mr5498731a91.22.1733392005121;
        Thu, 05 Dec 2024 01:46:45 -0800 (PST)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com. [209.85.215.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef4600d3f1sm960233a91.50.2024.12.05.01.46.43
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 01:46:44 -0800 (PST)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7fd17f231a7so289787a12.0
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 01:46:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVcb6TAqv5d8ivVm7lzrY2urwBVBbIaOilrasO+RMuZl8u6TujeqDu3gAT89kreSvnF+JE+j/SVovdL3Q==@vger.kernel.org
X-Received: by 2002:a17:90b:1643:b0:2ee:f80c:6884 with SMTP id
 98e67ed59e1d1-2ef012796bdmr13915030a91.33.1733392003345; Thu, 05 Dec 2024
 01:46:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
 <67505692.920a0220.1e4a28.5c89@mx.google.com> <dce7f8d3-f682-448a-982b-3890f223bedf@ideasonboard.com>
 <Z1FvOiiNbl7jrqil@kekkonen.localdomain> <CANiDSCt173zrs2pWEWXNYpVwzmi67cyPQTuYDcpiKMLwoAPifA@mail.gmail.com>
 <d44c87d2-c550-414c-b993-c74fc8acc804@ideasonboard.com>
In-Reply-To: <d44c87d2-c550-414c-b993-c74fc8acc804@ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 5 Dec 2024 10:46:31 +0100
X-Gmail-Original-Message-ID: <CANiDSCs0=SPP=u_O-5UAzJ0U_u9qBvLpk2B-+SVjyZfCwd5hnw@mail.gmail.com>
Message-ID: <CANiDSCs0=SPP=u_O-5UAzJ0U_u9qBvLpk2B-+SVjyZfCwd5hnw@mail.gmail.com>
Subject: Re: [v3,00/15] media: i2c: ds90ub9xx: Misc fixes and improvements
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi Tomi

On Thu, 5 Dec 2024 at 10:27, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> On 05/12/2024 11:22, Ricardo Ribalda wrote:
> > In your patch you
> >
> > Cc: Sakari
> > Signed-off: Sakari
>
> This series has no such lines.
>
>   Tomi
>
> > You need to remove the Cc: once someone is already Signed-off:
> >
> > I have improved the error message in media-ci.

You are correct, I have just sent a PR to fix it
https://gitlab.freedesktop.org/linux-media/media-ci/-/merge_requests/212

Sorry for the inconvenience

> >
> > On Thu, 5 Dec 2024 at 10:15, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >>
> >> On Wed, Dec 04, 2024 at 03:44:53PM +0200, Tomi Valkeinen wrote:
> >>> Hi,
> >>>
> >>> On 04/12/2024 15:18, Patchwork Integration wrote:
> >>>> Dear Tomi Valkeinen:
> >>>>
> >>>> Thanks for your patches! Unfortunately media-ci detected some issues:
> >>>>
> >>>> # Test media-patchstyle:./0001-media-i2c-ds90ub9x3-Fix-extra-fwnode_handle_put.patch
> >>>> WARNING: ./0001-media-i2c-ds90ub9x3-Fix-extra-fwnode_handle_put.patch: Don't Cc Sakari. They are already in Signed-off-by
> >>>> WARNING: ./0001-media-i2c-ds90ub9x3-Fix-extra-fwnode_handle_put.patch: Don't Cc Ailus. They are already in Signed-off-by
> >>>> WARNING: ./0001-media-i2c-ds90ub9x3-Fix-extra-fwnode_handle_put.patch: Don't Cc <sakari.ailus@linux.intel.com>. They are already in Signed-off-by
> >>>
> >>> What could these mean?
> >>
> >> Cc'd Ricardo.
> >>
> >> --
> >> Sakari Ailus
> >
> >
> >
>


-- 
Ricardo Ribalda

