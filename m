Return-Path: <linux-media+bounces-23113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2559EBDCC
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 23:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 016951883C6F
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 22:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628B31EE7C4;
	Tue, 10 Dec 2024 22:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n+nTsUkp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8243B2451F1
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 22:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733869468; cv=none; b=NExyFIKwUkWsr2up7qXJDnHqc7hzTMRPr1xWaYuC74nRquTFvQmY/5HqKrZkjN7HiQP34lnm5289glnde7wEteT5R6YBB/v4ElbLfwzHaYmyUlrZRrfC0szyWZYvgGYoM7H1c/YWZSaFH8yEaLH0Zb+Ma4ZBbujdbJN9XKPBHj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733869468; c=relaxed/simple;
	bh=UDtAyv6MVar5wVjjN6R7xB4Q3aJEBAWazvq5Ytlm2z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DD35+GszT55dB0l1ju+kaVsp9kl/nBN60eijnYIoFpsRch/6DUpsVebZ1Kc4PsXbLL+81c+DCxhTISbQ2EdV9x4c+TjYm1lfqYWklJUBydxfPviQtShGt4I5l6P/K4prNezkPO6Vec9AhaGrBnzQXTx1u4ET2DLhIKNkFtyf49U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n+nTsUkp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21661be2c2dso19129595ad.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 14:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733869466; x=1734474266; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XIMeYvFhNfx//UPcqXSHkFnvtxB2Ts7daLplf9Z2YCs=;
        b=n+nTsUkpjzqvQ7aegju+kpnldi3GG8wdXM1+yiuW/GRGq+o/QxCcZdqepLpawIHuaW
         d1L2tpJZ0LGQRN2xvxvc/JWruYlZx+YXDqa23AH4DXwPtNeny5T9AsnGp3toAJseayyl
         cKv5ZDLU5GggKc10Z5L33FHIBiMTc4rKpDD0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733869466; x=1734474266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIMeYvFhNfx//UPcqXSHkFnvtxB2Ts7daLplf9Z2YCs=;
        b=rn9BUpAOa8f7P1cUKT18JLQKtvjXvcbYKs/+UZfhiasn/GMYGOSXbEm6wMye598QK1
         I8KT305Apc5YAKD5lVAgnrsFwOCjYzLZBFaFdbpfeuu1xwyjcPAU/OIaWI6vP/gvV3vq
         tbQWBRkzh92p3XsvvhXBFbaW/YN3CK7Ff05wswG+CRNTBIz8qI9WhuR32U6LLfGy7UEE
         GCEH9H5zIkcUj5Y1t2sJsrr86nnU+di8ZAUOWSe4FIsZZ+787Ix8Vp6WpB3jZFEeDpbA
         lIgTMeN69jgFHXmWUhSVtrLihQnyiU7HfReTrbNQFkgjMi1BLaqdcs2TQjkuJYf0hl6n
         MxgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWshV1xOOxh812T7YBhqrEdRd7RzoAjOX//3uB8Ae/URfi+kV6KpxtaGhehIRbLHfrTMdgl/w1EVG3QQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeZsniUoA8WoYsDOcxZqYj9y1+/GgFTrqi6tzb+0/qWAUmTUOU
	7Kh13O7K9XTAG6eiBEA78FIz0ZuU6Av4KPRxbGSWvUByasXWgqD1lZFKDQIMrBkVPoapmVCgOA8
	=
X-Gm-Gg: ASbGncumhCLwhhDVGyAgjQCalGUcgKhz0+E6+ypFhHLmXiS/RCfSM+wFz8mVVmZGjxX
	nr7CpWn7A3UywTU2cB6cn91SPWTfuRUPLf5Z6kHHI7MKwBVSI2sw2uh745c8to2mhA+nwkuJLyJ
	1CZ1LlI/Gu7Ah4AOGhDowA00Hl5+ATo9egfmstRHiyGIQS9jf5DQBPmzuyXCv53C4IrG9v78qtD
	7BLOl23fTJs65y0b07c+3HfEJNkXbHVSIuEZPkDnZNMGUq2xnpo1ZRhd+oQWSfTaXxduSKrkzJr
	Hnil6BBBqdhIcvzL4pCT
X-Google-Smtp-Source: AGHT+IGVaT9Jfjj8cemRNQOLD2/Buy1ylXP1aCuwa92jDafLpt2ijVu/1ngBvzCnZEHeu9cSXksJAQ==
X-Received: by 2002:a17:902:f68f:b0:216:6901:d588 with SMTP id d9443c01a7336-2177851fb77mr11308795ad.15.1733869466097;
        Tue, 10 Dec 2024 14:24:26 -0800 (PST)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com. [209.85.210.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e5f031sm94596855ad.82.2024.12.10.14.24.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 14:24:25 -0800 (PST)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-725f2f79ed9so2046150b3a.2
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 14:24:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVoSZt2iQf1l0W2eYVRTfATx4A38tI+exWNUIsd+YPfQzxGj/8++P7dzte5viDd9xvbVrKoXmimAMYGpQ==@vger.kernel.org
X-Received: by 2002:a17:90b:48c8:b0:2ee:f80c:6889 with SMTP id
 98e67ed59e1d1-2f1280e29edmr959159a91.33.1733869464635; Tue, 10 Dec 2024
 14:24:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fe845e04-9fde-46ee-9763-a6f00867929a@redhat.com>
In-Reply-To: <fe845e04-9fde-46ee-9763-a6f00867929a@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 23:24:13 +0100
X-Gmail-Original-Message-ID: <CANiDSCu5gs-E_-S3xaqw9tEH2dkTjhWL7rRxCmQyoTsJtcjxdw@mail.gmail.com>
X-Gm-Features: AZHOrDmwQaGK_M_MA0hzJI7S4hW3-F5NWwvlxMENDh2hm6wEybat_G0-txeyg9o
Message-ID: <CANiDSCu5gs-E_-S3xaqw9tEH2dkTjhWL7rRxCmQyoTsJtcjxdw@mail.gmail.com>
Subject: Re: uvc_ctrl_commit() not rolling back / restoring
 UVC_CTRL_DATA_BACKUP of not yet processed entities on errors
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 2 Dec 2024 at 12:17, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> While reviewing Ricardo's "[PATCH v4 0/4] media: uvcvideo: Two fixes for
> async controls" series I noticed that uvc_ctrl_commit() stops processing
> entities on an error:
>
>         list_for_each_entry(entity, &chain->entities, chain) {
>                 ret = uvc_ctrl_commit_entity(chain->dev, entity, rollback,
>                                              &err_ctrl);
>                 if (ret < 0) {
>                         if (ctrls)
>                                 ctrls->error_idx =
>                                         uvc_ctrl_find_ctrl_idx(entity, ctrls,
>                                                                err_ctrl);
>                         goto done;
>                 }
>         }
>
> This means that if there are further entities with changed ctrls
> in the chain, not only do the new ctrl values not get committed
> which is expected. But the new values do get kept in the drivers
> cached ctrl values.
>
> I believe that what needs to happen instead is that the loop
> over all entities is continued, but for the other entities
> uvc_ctrl_commit_entity() needs to be called with rollback = 1
> after the error.
>

I believe that you are correct. Check out this patchset:
https://lore.kernel.org/linux-media/20241210-uvc-data-backup-v1-0-77141e439cc3@chromium.org/T/#t


Regards!
> Regards,
>
> Hans
>
>
>
>


-- 
Ricardo Ribalda

