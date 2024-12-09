Return-Path: <linux-media+bounces-22924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C787D9E9684
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 14:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2AEA16518F
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 13:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCDBD233131;
	Mon,  9 Dec 2024 13:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ZVqi+TBA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB751F0E56
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 13:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733749690; cv=none; b=PqL3TR4qKPUyW4EiMZkM7m4qUnlYE1+z4xo+6UY8S2gUAB+wkgl42uyofk330Vqd3vHO6+Mo8aii5MAs7fUNFdBqFQUvAB0MMjlm6tBfW5+XfvR8dc3OW4hd7xgJiO77fusUypy4UsTg1IUmfcZDYRgrGKwtVtKPTj/PbfiqOBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733749690; c=relaxed/simple;
	bh=Up+nUXDAiMsK3ugLu22ZAM0HeUa1MRhQq+XaQhxmSzg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=hgcZ629l6BupAIGVs4WJMLzAw59WJK9R/Y0fbhlrPGjsmt0OEEeahDzxzxHqzLxMT1p1X61Pq7eNGfsWnUvSqgIubJn2Je21dSF6PTOIsMAGD/HrxN44dUiGG+MjvYRf0bkbZ3oYIRLwrg/OWgEu+VwtrsAsJvNlK7KhfiP3Fkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ZVqi+TBA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434a044dce2so47093395e9.2
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 05:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1733749685; x=1734354485; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Up+nUXDAiMsK3ugLu22ZAM0HeUa1MRhQq+XaQhxmSzg=;
        b=ZVqi+TBAnwQeBXw6oviKHmXF8NcL4D9piUIMLtPeyP0w4gQYz2kEJmqdffAAo7/1MV
         5Gq+AKo6q4smF39RFNsYaKFCMV7MEud9dLkXHuTLkSB9VhrmGLQA3ql0vE/Rn6ZU5P65
         rWJU11jSJFH/GCQbRwf6+HDljQyNzkozqU5bNCEslSDmdhtxg18NEBN9VB5uS4TV/dXc
         f9KUQ1Iukl1ZxrVsVpMTRJb2LS9HEmQ8x9GbE8H3Mu/zUUPbKPv6VmoKkScbwun8rJrL
         /UQeQpW02m73/4wGgMDnrz2VH+JOBOdzvoshtmQL5DNPLYdREA/wvAa6zbfGWSdtWUy/
         a5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733749685; x=1734354485;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Up+nUXDAiMsK3ugLu22ZAM0HeUa1MRhQq+XaQhxmSzg=;
        b=rCx5Ga5QtJurL2pqP8Ox65wbfI9VXapTAlR/eCrrgP+pjL6RcKysYmjcSVwp/Oie6u
         sVTmZjLaLcOddF3VVTYcNBk+ovKDsfFyUDJc5QZtcALY0kNxjPmxCwbMr+jZBPHlFaL2
         mT9smObbNVMXwIE0UR2MtKRkzh8/OVoGSbqzhFbn72IkEwnrv8Yu1DGQym863AeKXktS
         i+WqiRyYr8lY+zuIAywVrM8dqIcC7sE58LobpRPJ3jOgKIFBKPdV/ZkmdMxV+aJXOp7e
         wCTcCCr01K2IyfiAgH0jDoaUFEq16h55T4Vaj/IZq+IGaVllPhACwUAfzxGt6Nqhxofl
         TOcg==
X-Gm-Message-State: AOJu0YzkD88/Tt9drcVgY4Jjjp+iPOERL0AkADDv8EHNMW3CfFv1x44i
	06oUviXlUiFLGKv9NaZfHh+/Gdhk3DDqgnDm92kLwzTIFbSyi0mdh5F5XNrfcuBxlRznLtbqZSI
	LIt4=
X-Gm-Gg: ASbGncuCyqOa9MZe39x2qwESYbIdHxMd1kDIXrNDzza2FOnrNQk6tR3J9mMo9ORY7+Q
	o6rlr3vDYFHb8C60cZqj10T8M4gR7TpVZOP47o4Rp9r20u+Zi7S2/sVTQ0Srm0ccgePyayLGOf1
	Ve5EAbJWfIN8eOwBO/HlhW+wbTUwpnytirBBNlHA1RTqZFE4GyF/lj51AK5TDxkwmP+WokQtyVH
	VG9r9OCQjMgCc1oKVTQAaUkAMGQ54AwjXaFlsIeOFjYhznqo8+cNL2AhZVLFYJ3yzhivuKhx6hB
	yLddlrTuZJOsm1AmkSe9FpMkZQbUmYuxy/5wy2+dqarzFwu38A58J6vkzpC+2w==
X-Google-Smtp-Source: AGHT+IHK0DoVNj4N3n6Ujv/UMDq7Tf0s8lMi00JnfM/kaUaACvlUzJDnkFKlh5gNN+lEdteX8m4E6A==
X-Received: by 2002:a05:6000:184b:b0:386:3ba8:5326 with SMTP id ffacd0b85a97d-386453da225mr274389f8f.21.1733749685443;
        Mon, 09 Dec 2024 05:08:05 -0800 (PST)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6696acc74sm333286866b.134.2024.12.09.05.08.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:08:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Dec 2024 14:08:04 +0100
Message-Id: <D676YXLURPT6.26V4RJBGJYYGR@fairphone.com>
Subject: Re: [0/2] Some small preparations around CAMSS D-PHY / C-PHY
 support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <linux-media@vger.kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
 <6756eb28.050a0220.34a8dd.2e9b@mx.google.com>
In-Reply-To: <6756eb28.050a0220.34a8dd.2e9b@mx.google.com>

On Mon Dec 9, 2024 at 2:05 PM CET, Patchwork Integration wrote:
> Dear Luca Weiss:
>
> Thanks for your patches! Unfortunately media-ci detected some issues:
>
>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> Best regards, and Happy Hacking!
> Media CI robot out on behalf of the linux-media community.
>
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/679145=
00/artifacts/report.htm .
>
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.

Hi,

What am I supposed to do with the above? What issues are detected?

Regards
Luca

