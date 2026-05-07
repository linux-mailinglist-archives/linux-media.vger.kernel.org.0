Return-Path: <linux-media+bounces-60846-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IK0VJ2nV/GlvUQAAu9opvQ
	(envelope-from <linux-media+bounces-60846-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 20:09:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D67C94ED3C3
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 20:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D98E83027B69
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 18:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6947744D6BB;
	Thu,  7 May 2026 18:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KW9MGIg+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF194305E3B
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 18:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778177361; cv=none; b=TXIqzTvUz3XOMqQDtXILMzEpXG/bd4szHwfP8+ZWGB8kIVUSijlrirfM4f5aD+CGo+SelWeLGiGBTAYTiJXR1C+KpP8vF0XNjuTgoPRlsyg2gLPXZ/Upw8Z+IdPxHji3+w/Enp8gnMHr6y5T2R/b3UHt8l+9jqWftBGskQzPW3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778177361; c=relaxed/simple;
	bh=7lRbH5GtDlDCC/yPiv7D1v2WHdT10RJoVEJtEQNae74=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETmZFKdZKTkulb79C3fp3o7cPHMMr7dQhq5QvwRqn1CC3wPeoMoRpc213Md7khGdEfQ81uoRNF7bx+WGLoMB7qiTy/wUbRSUjVjcJn4U4pfCHZUtiGAf6uGDwm8dDuXBJRFqpVZVQUK7UUwt7fmTdIsDMg3A4gqDrk90NQEFMBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KW9MGIg+; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ba21d32776so8855185ad.2
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 11:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778177360; x=1778782160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TQzjev0XOUlrj+KdDQaFinZF3pxM4IjVAzTFa8M6xz0=;
        b=KW9MGIg+8TV8rxkGoECUL3EbmfZqbihQQqF6BYYhh4FR/ZPGoU+BuXDM2l6Sa5qZm/
         vyT4bv3I2sBMBfcJNBj6EAzMk2uyMoouYPl0SV1LQZ8c0HXXJ39Z6i9D7pQfshwZu2oK
         zPe80xSbotuXrNU6MTOAKdn1/KQg3YT49Cotkplg8U7u8CL8UQYsoskNS6td+lBDzcQV
         bynbnUIPe1KEwmJB704ppQe877kH9w2/F3RQvuecHF4d2ymsItnHUrxUO6wGI0Vbh4bE
         /oJoGDamJX5fkqx+b5JWkykPMLMfODq3NiK0/ZMtpf8Ws7WrS3pcG+f6gcDZa1btwxKG
         CXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778177360; x=1778782160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TQzjev0XOUlrj+KdDQaFinZF3pxM4IjVAzTFa8M6xz0=;
        b=A5qL/YdTFcOm5g/EGI2/EqSXzCaZXqsIROmeLIPbZBSDIMKTzdsMGKt/h+skAMv3uq
         xa9DmgNZEO2VhKC0T09cehKOt69WnDacM8pHrGdQqUDl80hsxfhqqPQSACLGDB7aUV/v
         TzrUkuIPVGaooP+A+iRntddmPRraNM02YG2xK3IFsm69R1cDVb7Kg2wjyyc4WbJZ6KOj
         XyT2a5Eiiaaj8fDAelGU39PEnCvAfruBtXn4/mMKDcszCn35q2VfwRcqVm8LXjS9qkVI
         zpTwFAP3dZkIgxp5d2+Zyy3/6bKCKzkBCBfpsrpPcmfFnn7295oOU1hZUwx75zNp9AD7
         6nmA==
X-Gm-Message-State: AOJu0Yw26fbn7RAV0oF96cQgWMaFTK5mAI56/s/cwBnY8LLARBW60zuM
	DfCscyj0Q67ClgIdiATeOoZ61Rs3tUa68gfW0fL6a8JUQ81eY2iBBiqqRY9ygA==
X-Gm-Gg: Acq92OGC6ygcPb4u5F6C6TwKG0TPcjZmfGPpupfUKvkOrrr6OLe2ypD/f/hhANF6MUn
	Aj3dplDyUxohHkRu0HBsL0sqxayE6/o/HWbTEhWinVlysTHSAUwVBsYPrG/AcOjMy/XYq4i06j3
	RWGd7HQCUVEDEw1l73U0xw0gL/YyIGvGnOSMcPZOfbkE/8LhLwvUxVpU9RYmFAMgmoqfFXUQiYi
	p7iKPa6MCvXt/xPzB/+wlixSkVV9t3lIGNa0pTIhdIBRPcEDqZ/m4jg5b5A0UyIhUyJQofZ+BrC
	GH/dXHBRxrMzIryrQinXqOMwJksQqP2mf2FfLt5rVh/09sPW5mTUIQhvDMj+JMia6PDivWicrm4
	OffglExNGwXQGxC2Aie6YtXzepy30wDWhAF81Xg0O/XsUPdSI1g4l3Ej4L+dwyaDy69CnWdMbP7
	Wg82fPefNs+aJxWeURdGhVEW2dUYrd
X-Received: by 2002:a17:903:246:b0:2ba:5967:3536 with SMTP id d9443c01a7336-2ba798bb91fmr87322005ad.41.1778177358250;
        Thu, 07 May 2026 11:09:18 -0700 (PDT)
Received: from localhost ([2405:4802:1bf7:b0a0:33c8:3ea:357a:8f94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae783dc50sm4126335ad.43.2026.05.07.11.09.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:09:17 -0700 (PDT)
Date: Fri, 8 May 2026 01:09:14 +0700
From: Nguyen Hai Phu <nguyenhaiphu06@gmail.com>
To: linux-media@vger.kernel.org
Subject: Re: [v2] staging: media: ipu7: Remove unused struct
 ia_gofo_secondary_boot_config
Message-ID: <afzU6ZppU1VuKOgu@phu-arch.localdomain>
References: <20260507151446.153614-1-nguyenhaiphu06@gmail.com>
 <69fcc092.050a0220.37a435.da1b@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69fcc092.050a0220.37a435.da1b@mx.google.com>
X-Rspamd-Queue-Id: D67C94ED3C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60846-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nguyenhaiphu06@gmail.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pages.freedesktop.org:url]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 09:40:50AM -0700, Patchwork Integration wrote:
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> 
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99277356/artifacts/report.htm .

I think there is something wrong with the CI. The Media CI robot doesn't
specify any issues and the gitlab job static in the report failed to pull
docker image.

Can someone help me please. I'm new.

Thanks,
Phu

