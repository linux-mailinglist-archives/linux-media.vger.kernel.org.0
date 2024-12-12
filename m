Return-Path: <linux-media+bounces-23317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 741AC9EE66A
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 13:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFA96284333
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 12:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3497121171A;
	Thu, 12 Dec 2024 12:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0YZoAAei"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5BC1E9B27
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 12:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734005655; cv=none; b=uL0w56TWmoYPBdnLfvSj4LUitLgJWOPuLNBJzMbdCCYUJ7Db7yWxFmQu5IcG4zRGSKHofR0kZ80GW3fPOvbsoUiypsruYLRcqdMnD498HUla1Y6jcyFDicwcy9yOS041mc8McqtKL8ihPio0QxSH+xcwBo11qtvJ6pSHM3GjBoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734005655; c=relaxed/simple;
	bh=NnWWQ7s+xiCydG1EBjPP4Lts+GWafxJzMYSkZsEMb4s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Bjwyg2mFNK9gn2Db3dfMpnEuHAVigY31sjgRfljmDR4gvieq7uXaMnWrXyLBsL8mc+Pk0QlCzTBodx/lu5ixYFHv48D9mAkW7uCzGqpc2yU0AcFiOrBbnrCcMjl2UyCE7MEUELAblQmN9zlTFBwnayCdiafwYtCrScyW8J+B9ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0YZoAAei; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ef89dbd8eeso338698a91.0
        for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 04:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734005653; x=1734610453; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iz2ThSrPMjmWOFlJluZzmwdptoS/jFwVFNW40jm5xbE=;
        b=0YZoAAeilOPZJsltC+d7HEnGAXrcmz2JL9eIM7bfJWUOTbuKVRqUhtA9Jtz5HYDHYM
         Rn6ytR2CxTVUY56Q+6FqsFkeUZZuAQoOQzlbP3vdB1ZYBo0dcqOEhKkgbeiDtMHV5kyb
         NB3NpcBgY3HUgdbTpvnM3mv4MkId5vNfiNQ5oZuvZl4bXq3lw6pCizVeS4sSTb17Fqkk
         XgYWsY1oDRPXnTKR7+CKrnG27rFTLP0biJf7n4Fi6BO3sDB/cOCx+KXH4/0yT5pNDlKa
         vkcDaYbJKvK5Z7zajmc9qcM/U7UfzkvpGOSuooe4anYNF1qPi7J1fDotyBsnflH1p27P
         u+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734005653; x=1734610453;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iz2ThSrPMjmWOFlJluZzmwdptoS/jFwVFNW40jm5xbE=;
        b=MuA7IylXZt+o1S8rHAvZB8PCke/ci0NW22ITlYBdy7BU51LFjKcRqZn70IQBTn7x8D
         TPPmEzKiYxcY7eBhSmdf4pzDMAx3UQ25XRdDxwIYj6AjboafF5X8jA5gLRbJKebdDTuF
         tclmei1nUpRWWFIuuwQpoRBvRpVqKZVmKOsdtVHcm9ECVEBFTDz69vTOXCjX8xOLzKGC
         a/AJAL5hdM0gMTtqW2/bMo0SKt08zwsve4kwkgyT36Gf/6OQjKWC7QwOlbBkybVFDmgs
         q/s10A/iC3pZ/ipRsk5clNVFhch9XZg0AYJki7JFpU2GUVUmKgw5aZH2isHjrJLTd6FN
         MuWQ==
X-Gm-Message-State: AOJu0YyBorLQWbu3XTXhzkoTpThiXHlZ+4mxcWNPCyl1HyC3WU60iWiU
	91IAWkhN74E6hyRiZdVhhgrWs4RQl2HkvR3uOD3XqJDE6H6p9EH5R/AEeaLc2USsU9cq3sGNRJ4
	G8tq8Hv1tGjGYrrvYC4xMTBSBZrfxURg0vE6odMhvzho9opWxRhkT
X-Gm-Gg: ASbGnctc9NPqywgxat3C6hDvoJCDOfalyxCbtTOaITmWlvtOqnmIO6oVmU7BfLOYOSA
	hMQU3IKLEr/v8YhRvLR9OndqIX097+Hy7d0oQ3sZIafaFpnY86DIoXREfYmCuSlMF14IO
X-Google-Smtp-Source: AGHT+IGlIk1Fy62LDh/qqSTRbW/nohnxov1uc/Oiuvr6D3YKN5gptJuJHdX1Zf/0lwD3jPFbwl48xwPr7ipyhmEHDYg=
X-Received: by 2002:a17:90b:2248:b0:2ee:3cc1:793a with SMTP id
 98e67ed59e1d1-2f13930a558mr5648050a91.29.1734005652840; Thu, 12 Dec 2024
 04:14:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ricardo Ribalda <ribalda@google.com>
Date: Thu, 12 Dec 2024 13:14:01 +0100
X-Gm-Features: AZHOrDmps_vfs_15pxR2_SM-Z4nTBtZKQt-HgGQWL-vDNWweA2AASPrI8CZ_Ztc
Message-ID: <CANiDSCuYj_xV_b1VEVfS5ZgsXKnUSXc0W-4Rd+gip+9zkCzTXA@mail.gmail.com>
Subject: RFC: User/World Facing camera control
To: Linux Media Mailing List <linux-media@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi

For a system with multiple cameras (think of a phone or a tablet),
userspace needs to know if the camera is facing the user or the world.

AFAIK, we have no way to tell userspace about this it has to rely to
tricks/hardcoding. Eg for UVC cameras they match the vid/pid or the
camera name.

Assuming we define a new field in the acpi table/device tree to
describe this.... Would it be an option to add a new V4L2 standard
control for this?

Any thoughts?

Thanks!

-- 
Ricardo Ribalda
Software Engineer
ribalda@google.com

