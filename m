Return-Path: <linux-media+bounces-55790-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KGaANJ4tGmOogAAu9opvQ
	(envelope-from <linux-media+bounces-55790-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:51:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD3D289E54
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66184300D709
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 20:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D06837F8AD;
	Fri, 13 Mar 2026 20:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2QlqhAQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7843375AB4
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773435086; cv=none; b=A9x/9MI60miHYRso1no8ypFq1eU2XnUfrwAB3wj35JZ40tH6O+M2dJN98cbTcdvPmbVlGzM+WKzYoIeTbjaRoZInlqgUjZz/woNxit6ALMZVOjiMG98luejcMusro+s24kY3tKoKKhNHK/xhdcprH7zw7JRtoGRq87rzQ9QrtE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773435086; c=relaxed/simple;
	bh=Z6rkF1Q9RevTynVLwPPE1unjc9tpTo6jijfoXQMTXm8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cFvQ46hDJH8dkkhmqEJHez47dT4zpWlLWJQKno24HP6lJPk2OTkYnd8y8T3uVwEjO0K/nj2EMsZLIapArYK6gtJl7Gtf3dTDikoG2X70sck/BmUotY2Aa/esyRjXphTv+RSmCi2VehROiJVEePK80dU8Z7/F3A0neCl2RPwiN1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2QlqhAQ; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79900d6dc3cso27314597b3.3
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773435085; x=1774039885; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bNYnen/WIpTRvR88n+u56DIFY9ug5DpvsBdr7O5z1w=;
        b=H2QlqhAQHqz2TYS3xuNfnRGGGetAIyr0kSnvh+SjV24BjcWU8dfno5bdXvMUWKy9ye
         B9jFgFAzN4c4Gvuli+hKcImajEeL1fe1St9l3ERpNxeM7qjQRvAgCZWLGJnhoJyp2QFm
         U/4vtwPokWUS1CX2/bM/Z3kzPxotzXohDfgj2sMN+AIVHYKGwHu6yANnNrx5vNg2Wptw
         0BX5THZ47FO8yPQnli6sbX3fEHi4Ythx+1ayqhrOFT8qDEtllt6aphrNDLjj1zxp9Nr6
         qmENwO9IcuiHx3IYewszUcBMx3gGir3HAP3dzihOgzpx1vhSe9+aADPrAW5Gb0wO9iQM
         mc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773435085; x=1774039885;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6bNYnen/WIpTRvR88n+u56DIFY9ug5DpvsBdr7O5z1w=;
        b=M4m2EVDJKGdb/DzAx9v59nSQLni3edQAtjfjDsEM9ZUfTWkBVNfLB8LCtstCdh7Yf7
         LFSEDmk95LZCDsoU4DU9N2X7vnhVZZXUqAybiQDbHdksPHlLJ5rmxqgvuvRka4wagq0A
         OMDiS10K0fdf+8v9oYvB8fYnCUK88AlwVOpP6kCNMCXTO4BXDrYC39e76Dx62btfVW3f
         Whg0u+3YR8hG45/D2D2+cXOQfTfU4ScN+UAdWeL6VdxZnt8Vnta3k46KN1TsFZgLdUzx
         yM2pZqVkbU6ajGAZRBswM0rx7Myv4B+kO79Q/4o8LGlu6XCKxN/OBS/2K1QZohvLm57x
         x5aA==
X-Gm-Message-State: AOJu0Yxo0A7WTJfGI7YWcs7WHirS//VvVF+dGGzHgv5oBC8oAs/tbNS2
	/2TFqn/H1U4BwI2HVVHkR5bLnQ9ZteT2dDeP71WRBUbCru5qYRToaQ5u
X-Gm-Gg: ATEYQzxC7C8zTOuLP/VWZjJbVUa6gesRrJ3NKiOLT8hG7vrSYwdB9/9t43WtZIbOLpH
	rUwNKgrdmlGe9lnQAzIWjbmFc0F2QXOSLnnx5kb9JTyZ4XhFt8yIucEJl+exeP+8XlCerPPKPpg
	/wFGaU6nSnuMb/uXl48EhLWxEuDPLkE5ynib8EfOAzvvNvoW14lIxI929/JOawKtLs0sHL3n9ip
	X+HMsgyoLuLF3gOVoH0dRZhdzweBsljtZGSCZ3q+8dovLBjhftO22WnYIdD8XHK+Uq9DHnyPIu3
	W3FV4VvbNe4ElLVKIvGVLJEewd+8rwRHb/aShBVDOJI6xcUXZEQjsmA98JHByhHhnl9MqAr81SB
	XhoidlM43OtKpWQ0OT8G/Qj0CxsSmVGfIMU/O3G+GGGhlzUdmiKcsXptX3MNCLOmUgkv4eMTHKf
	JzWmD1s4o/SMUTfrz44YWL+VTHLsULmzFdeEdYD5Of/SeT1vk9YHV70xjDsKSVtPgX9Lzr5iOuY
	0G2QomwbVXjRncWf4AhDlMCtLtEFC1L
X-Received: by 2002:a05:690c:dd4:b0:797:f30e:45aa with SMTP id 00721157ae682-79a1c08b2c3mr53203807b3.11.1773435084797;
        Fri, 13 Mar 2026 13:51:24 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917f4889esm50670757b3.53.2026.03.13.13.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 13:51:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 15:51:04 -0500
Message-Id: <DH1Y9HEL19NE.18H6NA9WQK0DY@gmail.com>
Cc: <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: media: av7110: replace C++ comments with C
 style comments in sp8870.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Tomasz Unger" <tomasz.unger@yahoo.pl>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260313-sp8870-cleanup-v2-1-ca679e62f9b7.ref@yahoo.pl>
 <20260313-sp8870-cleanup-v2-1-ca679e62f9b7@yahoo.pl>
In-Reply-To: <20260313-sp8870-cleanup-v2-1-ca679e62f9b7@yahoo.pl>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55790-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[yahoo.pl,kernel.org,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6BD3D289E54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri Mar 13, 2026 at 11:32 AM CDT, Tomasz Unger wrote:
> Replace C++ style comments (//) with C style comments (/* */) in
> sp8870.c to conform to the kernel coding style.
>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

...

> -	// not documented but if we don't read 0x0D01 out here
> -	// we don't get a correct data valid signal
> +	/* not documented but if we don't read 0x0D01 out here */
> +	/* we don't get a correct data valid signal */

This needs to be a multi-line comment:

	/*
	 * not documented but if we don't read 0x0D01 out here
	 * we don't get a correct data valid signal
	 */

Thanks,

ET

