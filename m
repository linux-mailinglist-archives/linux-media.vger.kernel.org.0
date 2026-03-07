Return-Path: <linux-media+bounces-54849-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCAEMefLq2n7gwEAu9opvQ
	(envelope-from <linux-media+bounces-54849-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 07:55:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A4E22A876
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 07:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13493301DEEC
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2026 06:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D798135CB91;
	Sat,  7 Mar 2026 06:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8zNd1SC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B4E3126C4
	for <linux-media@vger.kernel.org>; Sat,  7 Mar 2026 06:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772866517; cv=none; b=Mt0riGp+6HX1t4RiIH0aLy8PS7PSVQyS5Vflzl9aaeTPZsDKD8K+I/sx+hmVT92hUYKzrVWVkkVwrVboZUISF8BJKvf8peW/FFYHMGUL0LXjfVJgXM33mTdJK/qZREf0K6YWdAgwnLUFqAn58gsUStCdGaoibbhhYSMN6Nffxzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772866517; c=relaxed/simple;
	bh=1KvS1cSshswY5RxXwlNY6YjqFpwsiw3e+bF0IeZmQDs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nD1L86mxjRGtDl4/n113aqX1kMPEE90Ma0/WZrTzFb6PBKcmRiDAfvHrQVnr/xEaRG6SQONsb/kcDIVw6kcsiKVHMw/IpqhqgkSodkt/Xd9asfa2gU+49LdjsLcFIOjLZKdneZ1Zfj6ONIx9A7UqCuk10gyCgQBIyCX+t+6J+FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8zNd1SC; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-798374d0f44so146088967b3.0
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 22:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772866515; x=1773471315; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KvS1cSshswY5RxXwlNY6YjqFpwsiw3e+bF0IeZmQDs=;
        b=J8zNd1SCo9F2qUe3em66I9kRhqovf2f5zMEIBRON80MFYUts2F3jbsggOeD2ZZYRHU
         h4UowjYSRJTg7bH37f2HiS0Y3kCrCUPT8TeCxTw/Yc7IVbBmYoovgZamTt+fcf5d3kG7
         DYju/7UNYyyDQUu5xOY36EOFsVFDc3V17xg7UcUVm7zl1ygbTsHN+0mDXU4IzQpD9RG4
         aOleSFB7FPGSn7ArOPB/e22UPhGTt5eM+V0qmnizNreaf+LbrdTcS9HWOlC0In7LqwFm
         vY+OFu1hszaViLtCb39+oukyerVi5tThVKrV4b1kaNBoAt+rWqlhR3Cmum9ifEdkFWqt
         B2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772866515; x=1773471315;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1KvS1cSshswY5RxXwlNY6YjqFpwsiw3e+bF0IeZmQDs=;
        b=VbHJ6BEaU3TY3kuN9J/09nSmOeQhjRL6i3sXaDxrv/aHBLeEqDWOGohn9Gy6Zw7xD2
         EHqU8yko19EDgZHMaK88C8MFdNvsyFCSzTeP2PNqLnwz7v3CBr/Behq5rUaegNRz8qXH
         vuesoTcaHpBM0TLBMulLRwaCb6RGd3P0+Q0lEYLds0W2dkYV9Kgm3gyqRdOSdMx08aVN
         bg7jnacDRIeV9NK1g6xIwT8nqD29q20IR1cc14z3wKdK/4iqp50VzkmhyDfTOAQ6+zZY
         THNouFJs/S8paJAEDU+yPgDfzg6cCBQPoNcKy7eNg3dCIvLke7N6C7QC3VomUhJhUYrx
         y8gA==
X-Forwarded-Encrypted: i=1; AJvYcCV4vPdeCHbKu5LdEiaUCKoOrQUz9swxHgvad3MsFhJ74wmO/f/066epQvVr4qwJy3/eIQFqWYR0Sv8f/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD9J1uGrHnSjbQdvVlXGI6zLqK9k9KmU4qct2RcE2myGPIHdTC
	u+f+FKcX5SB0ZM9QCN/q5nK+tLYFkFPLcoZBCsXeiThxl6kzKyOzSt5N
X-Gm-Gg: ATEYQzxwu9Px2waHR7s8jqVPjLuYEotWokhJs7OiBd0psNCdKMmS3rrkRkUbKkBX1yB
	XZcZN9RyXmx8MDVCO/eR/4BUSetXE7K0cOj6wKJ1w+ioijOfc2nKzTvKUmUKTAO4ZLIos5IzIfW
	VYP0Di2Wd1Si22QX8aFX4+J2MAcf0SfZIB+fQtnzjxGmZgrJzcTnIZR5xEcbtGKkaBHo8QgKh6B
	P+pelmW/fF9WitjCzgB8iCuj+OcvGeVD6LFCzY7nharYTzEFIM8e1a9b+ovD1dyfUEGyLgng/oF
	j70mMq6yoLhQnqfxMzySTBF0tJYPKecx/Ggsc0SDCr2F3jYK6/CPo92K5J882P25EfQoM1mNb8F
	fIp/hHhJZbuGQ/UUFsKYPYSeMUeF2mRYD6YOABlEVHDwNSqxpSfUnSWgVefxtQDjlc5ZpbwGp7c
	JctUsohmYMGMobM9j7bvC7P9buWrNL92942sk7L+LOqHwvAK8Ct3kzjExBqQdTVFUeeuUnsWYIN
	vEIwcLjX6DlVMcFQ8yLmYX2c8IcFZAhPxjj9c8eZOXTB2Dyz75hkturGAfUW46xpkA=
X-Received: by 2002:a05:690c:46ca:b0:794:c02e:f617 with SMTP id 00721157ae682-798d1ddc45bmr85688027b3.12.1772866515389;
        Fri, 06 Mar 2026 22:55:15 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00:151a:1f16:9af7:946c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798dee69ed6sm17497087b3.38.2026.03.06.22.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 22:55:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Mar 2026 00:55:14 -0600
Message-Id: <DGWCQ95L9FW0.11AOY3NZF4U2B@gmail.com>
Cc: "Tianshu Qiu" <tian.shu.qiu@intel.com>, "Hans Verkuil"
 <hverkuil@kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2] media: intel/ipu6: fix error pointer dereference
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Ethan Tidmore" <ethantidmore06@gmail.com>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Bingbu Cao" <bingbu.cao@intel.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, <linux-media@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260307030355.26840-1-ethantidmore06@gmail.com>
In-Reply-To: <20260307030355.26840-1-ethantidmore06@gmail.com>
X-Rspamd-Queue-Id: 71A4E22A876
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54849-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,intel.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.974];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri Mar 6, 2026 at 9:03 PM CST, Ethan Tidmore wrote:
> In a error path isp->psys is confirmed to be an error pointer not NULL
> so this condition is true and the error pointer is dereferenced. So
> isp-psys should be set to NULL beforegoing to out_ipu6_bus_del_devices.

Just noticed typo "beforegoing", will send v3 correcting this.

Thanks,

ET

