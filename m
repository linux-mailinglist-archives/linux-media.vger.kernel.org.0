Return-Path: <linux-media+bounces-63775-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Iht1BQhEIWr0CAEAu9opvQ
	(envelope-from <linux-media+bounces-63775-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 11:23:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1007163E7EE
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 11:23:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=f9Q6jMN3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63775-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63775-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 27BDE30D495E
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 09:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002B840B6E2;
	Thu,  4 Jun 2026 09:08:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FED440B6D9
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 09:08:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780564087; cv=pass; b=EuobzGNRuwt+9TexaK7AcwDOLAyMmccramwIGErR/rgOZL0g2Blz8L5DgXoPAzbW4PVyf39T2YZAHclgrSHgvoXq4AYnEbuAqi9XalGwNCDx2sB8ThoOC2OaJvXPtA8JgdpZdqjw/Ru0NtpM+hWpO2J4mCu7mvuiiIRUZCvmCFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780564087; c=relaxed/simple;
	bh=cD9M05orey5aA3bpSMKI1S9FSibUCYTB8Q6zE+g47FE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLrt6nz+INZjktrQFwP1FmNIpv+GSqZQpSsu3cWg0yr4N14wPv6bEDm+wMiKDJk08h1bpZLeJ+PZwLl+PVjXRah6UZVzSxQNdQXdH5GjFUMIr4p6yW++xtmIsBYFfSJd1HxzU7b/xZn5xcdOBzl3WOPZEi9U2QGM2WrMTXOw3HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9Q6jMN3; arc=pass smtp.client-ip=209.85.210.67
Received: by mail-ot1-f67.google.com with SMTP id 46e09a7af769-7e6ec655c80so212407a34.0
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 02:08:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780564085; cv=none;
        d=google.com; s=arc-20240605;
        b=JUlSeNbkgN2NfDgbujmabtLxLnB3lwTIRKeyDSbzqvYo0MKud3XaepMggC5L1Vm/KF
         OEOLlvQvipi47OJ4sAwj9lylc/f+ZW4pDw/GefDpjVUS8lQtqTiVTALIrR8eavYTDCwW
         odDPSMEQxeRJ+3uLj1G+cZp2JazwimIBMUSmwjxBIa22LryH2DqOj2inB9RxR9knV/fS
         hCuuquO94yUdsNcpRCI2hi1Q+UCNu8P0sSfwgYq4p5FvLbn7I6s/aALzILgClU0a4dtF
         i4JOSLtA9E7FXCIC9BmwSxtBQTKvMFpiPTrQhhDueyMPXGH0lx66IHOjZMYksF8lHfLr
         V9/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cD9M05orey5aA3bpSMKI1S9FSibUCYTB8Q6zE+g47FE=;
        fh=v6opVfyiEDTVaQnupfkmJs0u/jrcrZrgrU6Bjvq0uQ4=;
        b=LSSzjR1eD5ZXmFLaxomFGW8emiS440TH46e5amnabgWbCjfzr85JbH+DBEnrFe27tr
         fOCsvpaxQKXojSIFE9N+2Jt0LfCri05ewIJM0z76AKkmKzdxravBq4Ie0BkAXi08tplN
         NDm5rrT2LjJtn256I0C3AVG3eK7WCKEOO6MCONpgxgDiC3tDtozj6tZ9RmffS/eXQCtQ
         qz0eZ2fTBQpmTKBNlce+b0kMaOq9er0r417Y8GiW0oU8ZyenOMJdeG+QlqS9Jn96bxvv
         7JRt6zcwNV839QzIEXCGOFo/3ueoQ1ubBV65IYcoxxXLhfy44/gql4LeAyYHYU771RZQ
         fhNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780564085; x=1781168885; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cD9M05orey5aA3bpSMKI1S9FSibUCYTB8Q6zE+g47FE=;
        b=f9Q6jMN3dmgxU/otjzpH1NYJoG7O7e8liYZ2k9LjFeF+iSQYeUizu2teJbzYvv0X6f
         hIYVO2oQcaVby04FThSwZzDEs7AKuIkjqqVlfGsbsi23r1qixe7VOaflbOObm3f88ubn
         ySgV1lJ4vyZx8kfUeAem0HSku2w8gHD8wtNtr5ORUJ0u15ZTRwi0TFKbs9pnGnJO14+E
         ZHCoB/MRPoD25uBvEDUxFOF71ZPD5JWoBF5n/m2OHSFOBF1ju43k7ZOqOh4bPpMcmJMg
         s0J55bKHOr7/foCtelRVyfymC19bA3bhG2J9iFD2ZWUD4QasumIZy1tRdWBV51zfvvmn
         MBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780564085; x=1781168885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cD9M05orey5aA3bpSMKI1S9FSibUCYTB8Q6zE+g47FE=;
        b=Xmlh3DLddlNfqwyZLkgiAYXvvOMDMr/Azxr8MuwvSiVr+eMzS4RXaRx6KgfI+fP2hE
         5iRs3x9qGwbtIRrmXTY14AgPXssoCJuDu69yw0dKx+gOoIEIM5JAOl1QJy5QFiP/FbyU
         hSbKEVy21XcrHfSatZy6RHs+tilvqh7BjnCj7BYbiVsuwMZjwXMJwUW2l6HawbLi9AM/
         svxB3ShtRVBu3e+QLOZEYe/8bE53j58rKF/J1Q6ODArsKRD1pVD34RgLp3+KnzvJmigE
         I5pdyQdst22EhEoMSt3F9Pva4tdINBvvG7zdp39h8EFi/ifWcQDz2UDuE0JYV7Vx4kOh
         eYBA==
X-Forwarded-Encrypted: i=1; AFNElJ9MFUUp2vOXjGRsZI9c4tGSJRUnyiSnoodh2fxjEzv7Sn0ATXl/EM75bAJBsRyM9Tk1ZPA+Zj8tTYL4Sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvVa3jXsqNzZ7p6ffxpyNzf6SPazLoIk7Om4ZCw4DAR393k8Ky
	yzQ2wJ2prO0Td1wgjcRKf5/S7QutSPH1JxRnj7iGwVTk5JTzh8nAEeeIKqTF0UkfHc6XhTdk598
	4L3LWRPiiBEC4jYZg5aaSekT3CaT3Hao=
X-Gm-Gg: Acq92OEJ/ImmtnI5SXdS4akEB7LfUfMmEcf4URBpxONn4VrXLuhDmBzL20RNnXN4sOu
	SLEFVn9rUq6hSgxsqY8dA0X5vsVUZ0+JQg8MqPDDzW1K+lMVj3q/i9qVpEAhJg9/e87L0CSqUtQ
	o/DLRjzbGDh1M96evpqqx7HXeCUg7Qn8lUyoxaTZC1wociPTQa3/z9qGHpOxvOSM8eh9gZJRPin
	ZiMjB4fxJLpC1MPFP1rsKKzSwFKLmE2z3OJgP8lga8a+woZvVfS2oa64K3YjjfIxZOwqsFg0NWF
	cSB/dbXFGPCiiEffADypxoIKBzOmhgGEocYDILPulHlxoNTABnQ=
X-Received: by 2002:a05:6830:82ce:b0:7de:c87f:53f4 with SMTP id
 46e09a7af769-7e6e9d518efmr4969451a34.15.1780564085326; Thu, 04 Jun 2026
 02:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <oB5ie3iMXIF3Y880tV7tN8clu84kWmIaS84q29ShnUs0QVv21y1IOyXqc55FGzHfG9JIDlcIrhQh30TaZpC3vw==@protonmail.internalid>
 <20260604082510.45733-1-dennylin0707@gmail.com> <76b46788-0cf1-469b-93be-b7788be2bd71@kernel.org>
In-Reply-To: <76b46788-0cf1-469b-93be-b7788be2bd71@kernel.org>
From: Denny Lin <dennylin0707@gmail.com>
Date: Thu, 4 Jun 2026 02:07:53 -0700
X-Gm-Features: AVHnY4J9Me-6oprWIZ18dMDsRu8bSuPQwwXW_4lwh5WapppSHMZsl9JovC6p07o
Message-ID: <CAGEkeHeFJC_eMZnDbbjXZs+Gy424YdCNH-HswPgE3zyYrEnoDA@mail.gmail.com>
Subject: Re: [PATCH v3] media: qcom: iris: guard IRQ handler with runtime PM check
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63775-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1007163E7EE

> Could you please put your series of individual patches but group them
> into a consistent list - so that I/we don't have to figure our how to
> apply them and in which order.

Sure. If patches are related or have an intended application order,
I'll group them into a patch series in future submissions to make that
clearer.

Thanks,
Hungyu

