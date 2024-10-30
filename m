Return-Path: <linux-media+bounces-20595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A46469B63A0
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 14:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CAFA1F2212B
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 13:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BEF1EB9E0;
	Wed, 30 Oct 2024 13:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BKYcogb7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D89E1EABD4
	for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 13:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730293416; cv=none; b=sNp1PObu7OPNehLQKYk/4RS9SyvqwMVEGViVjAFnbCVXU97TJ53it42PWcmi8vaUTtTnffzxl0LiDFIn8UBuo7E8wIevZQ8vECwA0dA/3k9ufnudEThKt9nNNwr+ePwR8eX+knQmNFWLIKEa+p3gZO/0am8P9lMDMRvizKt3h/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730293416; c=relaxed/simple;
	bh=B5ojes9vhB74WYgrxUNoE+j+8oT97rLxbH6P45F0drs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=srdETCKX1iRrdtayBDbTSQsAFZIqbLB89PLW52PgIjJDSpdC52E5BDzynXYEsB8z1pB15UObCjXQVV+W0P0sAY/fnveRySwOPLNKlBhX8LxxZe18aCWprYfQY8LVIKF27QO2C1zR9lOAXhUiZ56eMQtJnTeSf8eis3QZWJPKQrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BKYcogb7; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20cdda5cfb6so63950275ad.3
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 06:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730293414; x=1730898214; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wEGbBUgCkfqqHUVn5/KarKK532x0ultKtVr1u8TMffY=;
        b=BKYcogb79K8Y7BwtZDWRbNKKCdpr94AkccMS7AjIZzYfa0s4GmqnMJgVMgRiKxxOJ9
         pL1caUz9AFp/7WpH6ByM1k/bC2w+2nRI3251c2AiNsJwKxGO/mYMxxhom0giiK8pxxUx
         JqfhH0tbJ88Cc+I8PQyVoGaTkoLFyTb8Fdc6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730293414; x=1730898214;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wEGbBUgCkfqqHUVn5/KarKK532x0ultKtVr1u8TMffY=;
        b=eo9fkzuncHCIlbPmkDK9Mm5hJ4C/NcCn1gUW/sB+y2BbuY+UFDkB6NPZ/UN2HBZXrn
         rUUYLiW45IvHN0yDYuQHapZ25VwMUJ0mKV0u0s4of5ac4DbtrOSpoAEzfeAuz9/B5j8L
         ryU8zRZG91PjLWlW+2e+EFezKRanPXOgYZ64kJDG1faf8PKxv9Rp8gegqIHKJHbv91lj
         WZKriTTq50N0osk/WpoL0ioReQlMChH47c/99NLyvG0nuJOeM1b43X0bOb6/Cyf8NLh8
         Ju8tI7cltNWpm6CzZkp276htgbRChmWpwli2GMHA52Y2X/QrkXKCDk3RNfjwGZqm+7SN
         Quqw==
X-Gm-Message-State: AOJu0YxMF1b1B9tfF5oa93xRDFI5SjECSZCRVH+U6qtKikbcOYgNb7/U
	YJtNuvS0nbzg1x4fxWwQCJqWipVjBF93GSJGfB1j6Oql0Nh9dg6EA4nEsqo7OeP+ZovqCN25Uv8
	=
X-Google-Smtp-Source: AGHT+IFzusc4iC2t3iDE+tk/4oX4KPgoiCayhlemXds5HsOOIlg3eB4XCbNO97UrVF2p3SrOIxoMyA==
X-Received: by 2002:a17:902:dac9:b0:20c:f3be:2f82 with SMTP id d9443c01a7336-210c6c82bb4mr185365375ad.33.1730293413519;
        Wed, 30 Oct 2024 06:03:33 -0700 (PDT)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf44524sm80614545ad.25.2024.10.30.06.03.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 06:03:32 -0700 (PDT)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e56df894d4so5267898a91.3
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 06:03:31 -0700 (PDT)
X-Received: by 2002:a17:90a:9a86:b0:2da:8e9b:f37b with SMTP id
 98e67ed59e1d1-2e8f107c738mr17086649a91.24.1730293411128; Wed, 30 Oct 2024
 06:03:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 30 Oct 2024 14:03:18 +0100
X-Gmail-Original-Message-ID: <CANiDSCuPfmV-0KLrdnvVojvtLR=OsFUzLNhnqM1m_ytvzjoNOw@mail.gmail.com>
Message-ID: <CANiDSCuPfmV-0KLrdnvVojvtLR=OsFUzLNhnqM1m_ytvzjoNOw@mail.gmail.com>
Subject: UVC: Privacy gpio as subdevice
To: Hans de Goede <hdegoede@redhat.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Yunke Cao <yunkec@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Hans (de Goede, but others are welcome as well :) )

Some notebooks have a button to disable the camera (not to be mistaken
with the mechanical cover). This is a standard GPIO linked to the
camera via the ACPI table.

4 years ago we added support for this button in UVC via the Privacy control.
This has two issues:
- If the camera has its own privacy control, it will be masked
- We need to power-up the camera to read the privacy control gpio.

We tried to fix the power-up issues implementing "granular power
saving" but it has been more complicated than anticipated....

Last year, we proposed a patchset to implement the privacy gpio as a
subdevice https://lore.kernel.org/linux-media/20230111-uvc_privacy_subdev-v1-0-f859ac9a01e3@chromium.org/

I think it is a pretty clean solution and makes sense to use a
subdevice for something that is a sub device of the camera :).

Before moving forward, Laurent and I would like to hear your opinion.

Regards!

-- 
Ricardo Ribalda

