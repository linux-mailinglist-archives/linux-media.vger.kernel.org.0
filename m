Return-Path: <linux-media+bounces-54029-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OM0+NMqzpGn0pQUAu9opvQ
	(envelope-from <linux-media+bounces-54029-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 22:46:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9C71D1B98
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 22:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FEB13013A86
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 21:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AB3237713;
	Sun,  1 Mar 2026 21:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OaEciire"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AAA1E5B64
	for <linux-media@vger.kernel.org>; Sun,  1 Mar 2026 21:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401602; cv=none; b=u7KmAju7BMFoDpuT9AaKsTrodFUAJZeGSXHz8pYBqG+Mg8Y1vAmoNrfKWYB9ETpdDByhr54cT+JxMUQyjqC5lzsdzhlWE+L2/gFjW8yaTgVhliPqkCXXrm/F0iQRz4j8cDSAAwxS2m1ByTHS7SfEUeVtijpfCLac5qPuXVq5PVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401602; c=relaxed/simple;
	bh=SAzVrDfwUIGewjrDVkjEr8J9zeEgMjXmDkAs1+MDo6g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ImIhLaEGk1enhhsv9sKCNSHAgH8pN+0/7IuHnR7+BetPdd0euZhy+vg5M2sITg2L/Ajs38HMAgcJGjpLAGAydg+hM73dqQ0qZ0jwQ6p15T1wioNWKifhRoLpR9abFS/0CymXqC3T1UEFp+J4kteEm95fimgGpTN/cXlrCRq4UpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OaEciire; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ca6595c8aso3417227d50.0
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2026 13:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772401600; x=1773006400; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4ulOxVmo2bFzgV4F51OFpn+fHFE2uWhzh25V1FCNx8=;
        b=OaEciiresXyw1N1+aptmeu3DCsy5OzJHlXukAYUTdlIx70ts61sALcYAWdqlWZspNp
         E4GgypgHITWtTG8mt/wsD5su6BBsuPhU2cnPWzzKn2sCEiXOFm6cSjEMk3AvArBuVt63
         T1cPIaon3Xp7miFxEALDnAXlJ9JgF4yaSCfE6tVfybkJ/T5YXuCkyI6ZrwJs5x20i8j/
         T996Zw3b9B4rOpsQMDyq+hQj6Sfqy6cbQ3cgRhUMuxH4mncRN57Y7ROEqN/PJtaSoTs1
         RNIRbcIuZjvLZVw7JkWWdtlhaREqmlibP7bS2qVEEu9lZGovh+mvHGpSB4PFK/5Fgkkn
         UI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772401600; x=1773006400;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4ulOxVmo2bFzgV4F51OFpn+fHFE2uWhzh25V1FCNx8=;
        b=FDm0l4e80sa/gjKrKKqBZNJdQxplXBzoZWJA4O8aPxWaSIJ5bhcwTI+f77CGFmTqBf
         kjbcwo+ww5ypZl8czJgEN7Ac0EAdnyQqTL3cMHEr6v9Mjkl/VS4yiNCi6PLyA4QP2i2z
         xsKoHUCai8F1iMdJ4Csn2BYJj5RlY2TiOo8wgssq/cXA8o4oYnz14+YPEECMag3KFp+z
         OZeqAwvzNRfpvnValdedkOmh9ZAeSoeUQokrYpe+tcx+RWsHqNh08FgPUMiRRFlDuOKc
         Fmpw2jklYkpUduQ5aDI5XeZ272h9xzZCEo+b6x5Wnf41Tytk1WAEaR0jfVKWznyvKTQx
         M+Fw==
X-Forwarded-Encrypted: i=1; AJvYcCV07/VdxgAiMSNW2TYOWKw7167c3u/AOwdIfgFNUv2gBwABjFURGhFEzfAlQw/UdBPUOnQpWTApaKSkIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3wO7mBxSuvejDAGQYrGPbvmC9cK5TjVVwJ/JTKAzXHQQOT+cs
	oyZ8NYtcuoZRgJWMY4b5EVW3loxyeRTgc74689cdRbWPWH0M6bsBqkObRK6gaOzdVbA=
X-Gm-Gg: ATEYQzzSP1cD35f3wRSuSuFv0TAWBMN0qyN15anITWflfoSoo6x53XcsVuEgSWDSY+O
	x2hma1eecy+jpe3VoWubihmxrzdTod5zh0PEq008Rgmmey0WQcdXz8bJ1vFI6qKkFDUiARCC8qQ
	wMrOYsLjK1EpGSQLEZscCKYDnl3oLQZ9zKjqzv7KcUqPDiwhSeslvbbphVv4tPzxLvRV0dTQy4L
	XRGL3q36ze4Gi/b+npHbpNhV5Ikm8J593kglxQcazQ2CwM18QEPS+N+jmgNW86Ss6Q3fzr3gOgD
	LaIxyTmPREBen3tkkEd5YFPZ0y3g59g3nI1eckzxUWub0nqH9vZ3qgHAr7uMNE0M/prUdCKvZZI
	zhGx2eE/WnGzl1FN7GJUK237qWl9a/tA9xDLuvBKpaMcpTeEpRpQAFF97egpj59UJdinbyRjIAg
	zsMRqj71XO2497MFwLfhh8MOf4GWCOcIdpIkPUAW7GwzE9KKyaSZF9wExIMFL6Z1olRtn9VO95s
	BY8aTp6aJYtBv5of3wS+m54gVe5P/H0
X-Received: by 2002:a53:d20e:0:b0:649:b2cd:eb7d with SMTP id 956f58d0204a3-64cc22fe637mr6603743d50.68.1772401600134;
        Sun, 01 Mar 2026 13:46:40 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb7650ac4sm4944505d50.21.2026.03.01.13.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 13:46:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 15:46:22 -0600
Message-Id: <DGRRXA8LOOOQ.2W7O8M9WU6GIM@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH] staging: atomisp: remove unnecessary else after return
 in atomisp_cmd.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Oskar Ray-Frayssinet" <rayfraytech@gmail.com>, <hansg@kernel.org>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301212047.3649-1-rayfraytech@gmail.com>
In-Reply-To: <20260301212047.3649-1-rayfraytech@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54029-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A9C71D1B98
X-Rspamd-Action: no action

On Sun Mar 1, 2026 at 3:20 PM CST, Oskar Ray-Frayssinet wrote:
> Remove unnecessary else clause after return statement as the else
> branch is not needed when the if branch alsways returns.

Typo alsways.

>
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---

...


>  	if (from_user)
>  		return copy_from_user(to, (void __user *)from, n);
> -	else
> -		memcpy(to, from, n);

Put blank line here.

> +	memcpy(to, from, n);
>  	return 0;
>  }
> =20

Also from what I can tell your sending a few patches affecting the
same driver, typically you'd make it a patch series with a cover letter.

Thanks,

ET

