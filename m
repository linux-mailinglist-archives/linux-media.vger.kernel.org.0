Return-Path: <linux-media+bounces-47836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9BCC8F903
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 17:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8952E4E3F15
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 16:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B892A338F4D;
	Thu, 27 Nov 2025 16:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOHZdm3m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EBE33890D
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 16:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764262570; cv=none; b=NWOD0CswRXqXVT3VLuenG1ogWZ5rmU7GUA47lipnozeOVxjX/PVe+JzsNO+QBsL2AsFNmJ5BNyq0OCNF4J9Di3I0FatL7zGJf+sB6UjXLked4gxqVQLgFoaGaITnrXwnP/0XYSAAbKCrQ9IEJlTVcoYFB51T5UTd6861pfn1aH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764262570; c=relaxed/simple;
	bh=f/Hdib83yeaPmP2hEtEtoMIthnmHtUVstZueQCCgh1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kV9R+H8aXS1wgyldnvjxCJkG8UMuGqP1lVoUJfW2KPxE7qaZVMjRdZyQmhM05t1qWGZ7nzdIyjIuHGPhUXvtBrz1bXFaZd4KB//NQaH0NCMGqJ2piC+WpdmvvyjfyXG7e+RN8m6Nzb/XkM13QtXMb7TT7DhmcrMTd9LXPI/+r94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOHZdm3m; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78aa642f306so9845667b3.2
        for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 08:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764262567; x=1764867367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/Hdib83yeaPmP2hEtEtoMIthnmHtUVstZueQCCgh1A=;
        b=aOHZdm3mFuP5IU2/xsyeOnABkUrArXxzO2qbL+BoR1z+kvZk6cLqAC5TsucL5nhZqU
         qWl7WBC2OFeKXyAvPhIGQxWeRMUP2hDwWsxCo+68JHndY4G4LlGohdemaHbOokVDhtep
         P+6IfmHhHi7FMO4g+TKY6N/dK4iC4GIMD3sPYPyxMQprxptwUQMpQJUK/MKF6ZxWGOrT
         Uh/mnxfrvTWdeF/wUGEl0dMIaC6/AswHuK2mNWvTcwxV5S0z8rYza2OkIfkbv5L+m3HU
         1axe6458qudmnTfyX2XpE0tDQp8FBv9lywXMTvfqQs3Y+qtJwwCYQL5CCXrg95kFZhkJ
         smpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764262567; x=1764867367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/Hdib83yeaPmP2hEtEtoMIthnmHtUVstZueQCCgh1A=;
        b=SpuwnGdVomLsnMj7wLOq1UcwOrZpB+WMdt1fiHB4uLIs6vUAxUDOC4/Dw2fHc9jzLo
         uv2j5CqD8fI+JJN9UaEmD7qfhciuVjkgMyROp+J9h1KE0D3vLomiQy5GTK/XdKzrCSFl
         pIsKsThC1SygWUMrK4GlDFSJ71RbNYJNWJX4XFrDry6TkB8HR4Xuq/A5iVZFfvYvaScj
         ZuwCcV8gkh1TNobjf/lmJYzgQMj8HNeSWGOPK2UVglA8gvWCtZG9y5ut5RENnohEdDx2
         yUSXFwWg/r9Fpro2+Ug+LgCElvog0PwRmlOXevbVfTO3E07tPe9ySRenKEIOitOIhWrG
         kLqA==
X-Forwarded-Encrypted: i=1; AJvYcCXWPF3u6Sc0HeMmumaXAkgpk5PrfD09Th0RxIWbvgNkoIUW69ERQxernWRJXY+ns/GljbfvKI84AL7+tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKPwRHLnZSyxWZAAOXnhg3DTeIb3KgW6epeUIuie6hiwattAX7
	X+7SmUBc+9QUKODlCafxG5d4ZGzkwXC4V+rYY/t17t9ws+aGbHodlw5M
X-Gm-Gg: ASbGnctE267/ZlX9jN4dDf5EW+G1Txf/QpokEBoLimGmiMDEUHlOJfD2UyQSEGpB9YU
	n3Wly+J2P3E97nMevXk/APiIdD4c3fu/GrsjrK3SPmD3y8WdjKHz7qPeg9958gfKbAvr3QVsN0B
	XfQXrWgMyPr5sVImtURH1kGWRF4TIR09GXWDoKyBDUFQkU43kUjCuYwGYmKBgUGE7ldRhGKq1H6
	gzgoggxeKtzoSDppz2kjTNzBEewp5VdcSKBFsj5MPpxX4n/Mm/5EpsAPbduT3ptct3y+Wl+hPre
	aIs9asBQcZHySlxQj7dFwyabZ+A0v6CH/cA+Jh5JDiQm1I15DXJMNISMcPF7boaLyUdOWKlIutn
	Fg4nTJgeq8RUoueZ2qAIrrDuN6pv8ba5rFeJX79pz3YGhYFkgQ9KGEq3oY2dRTfFZ8+3kRwX2LH
	q8HjjXG+66ZYmYo33xG49VxX/MB53XNi86ObhtvA+dAbD7nPOz+CYwK28UYqKgunncSOSaK2Zlz
	LoHcqE=
X-Google-Smtp-Source: AGHT+IHz7yB79BQo9D16bnIWc+s4vt4ZNQ1duPWFEcIJy4RKXkKvRt4EL4wtVRM+yawq0Eyk7lEwvw==
X-Received: by 2002:a05:690c:3809:b0:787:cad1:bdb2 with SMTP id 00721157ae682-78ab6fd7c48mr81647827b3.69.1764262567431;
        Thu, 27 Nov 2025 08:56:07 -0800 (PST)
Received: from ?IPV6:2600:381:6a1e:8e2d:1d4d:5b1d:d0a8:2d05? ([2600:381:6a1e:8e2d:1d4d:5b1d:d0a8:2d05])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78ad0d5fe26sm7318487b3.18.2025.11.27.08.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 08:56:06 -0800 (PST)
Message-ID: <566feed0-c398-4e86-95c1-619b029a3373@gmail.com>
Date: Thu, 27 Nov 2025 11:56:02 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: radio-keene: fix memory leak in error path
To: ssrane_b23@ee.vjti.ac.in, hverkuil@kernel.org
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, khalid@kernel.org,
 syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
References: <20251126034105.236131-1-ssranevjti@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20251126034105.236131-1-ssranevjti@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/25 22:41, ssrane_b23@ee.vjti.ac.in wrote:
> From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

Try not to put an empty line before you are done with the meta-data for
the patch. When you put an empty line, whatever is after the empty line
comes through in the message.


