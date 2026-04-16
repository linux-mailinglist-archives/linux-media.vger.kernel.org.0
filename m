Return-Path: <linux-media+bounces-58863-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKQGJKqo4GlZkgAAu9opvQ
	(envelope-from <linux-media+bounces-58863-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 11:15:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D6B40C0CE
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 11:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 367473038A45
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 09:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F433939BA;
	Thu, 16 Apr 2026 09:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ds/1jm87"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0A738C2C8
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 09:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776330697; cv=pass; b=HQhDzSgCaVv3I3hJRBGQf57c2gRcHITd2uVckpYExKHG0+GUwPDbN9TICbqtWiPF344LtsJHmsG680w197QRQrE5sYHMrrHaWhW1dEa8ShdhTILRDUT2xnxy0SQiDZz6E5iXIlPxCtSKou/4/udkBgwWmNQywaKzvsAAr8sUjh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776330697; c=relaxed/simple;
	bh=lPss4pXYIIOF8fADFf1z6o8wrqt6CC0/v8OIPeDBCN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AaoNwQL8GSohEjXWrOM62Xx2S6HQH14Mp9GWAfIH0HH4QVKOPDrOe3F8mMBBnxA8hO4fdxQlrI10tykPI9t82YGcoU6DgWp1fxLfAdAcS4GzBNrKZRDnFF0EoNwSnSIqwhdTrf5yLyvuem3thc6vdUJbhG3hRrgltA0R43T0nbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ds/1jm87; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-651d692e833so3779685d50.3
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 02:11:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776330695; cv=none;
        d=google.com; s=arc-20240605;
        b=DdMiRww3Zbiw+kXExZXSteyolknyQtM+3vTU0/FLVkegoEtwUdZktKEOnwjy8BA4KE
         1l3PmOd4dA07EFJolAf+5sItddNgYkmFfh2VSEBPxxvdrFG1Rpp4S32wrbT6ZjRUVj4W
         vY6sZ9OfLmraJAORwmIyY9aIWo06zqPYApwjA7BqLM8amJ+VtrAIL0DMagmrhOos3m86
         evAQ8qlFRu+vWL6GMRd+6c/P+AItXawF7DNhWHj6l24ByKxGXHvlu9Co7PQWwA87nL7Y
         NU2pNrdFZmvoFp8DxAdMuUM0TAwSd4Tjal2J305/eWH8OSQRBESyFJtPxjmYxWrX+3Rf
         PTMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lPss4pXYIIOF8fADFf1z6o8wrqt6CC0/v8OIPeDBCN4=;
        fh=ZpDlaCrc4dmQrzsm9PUAvHnviJqhOXWKtNUjC/l43jU=;
        b=J5UMtr9JytUF4j4uv3KVbojPqf+B0IPDF2f/7TI17CtNbwHdf2Bu8GKgM7jMvqRU+Z
         VaTQ0SUo9wvqlMkkhP50MYXsZJZvdEtpLZqXrirG8/BpHgPDUbYtGzt9NSA9VcMEFf0k
         W7BR9YLATuFAg6sW3a9lvEYZGsYpeYWFPPPaiMf8Fb6UQdeBUHwmMbg1KpCyJ1fy8waA
         HEQSik6v6bK60Ob2P7UnYbZsC3P7gpjoeBxdhwa9KvcYewxkdkOllXNactyCQOko6J2F
         ckN9FUxmhUNA5kUCjQO3MaLsTsIbs8FzRkVO7sNU+AhwLawex199HM70XrbURv+bM1BF
         8ovw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776330695; x=1776935495; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lPss4pXYIIOF8fADFf1z6o8wrqt6CC0/v8OIPeDBCN4=;
        b=Ds/1jm87aCAoVUXxiXQfY6v6ION4oPz/OWMSG3pGIMj7aQPmZg9jSuLpbp+CLdsOud
         YqSH6HlGtnygSheNT3doTBVISbW1CEZNfdltKD1urNJo73CQsvs6Vqx22GS5AUrh61Sz
         OG3yg/0c/pTuYDuqiP+vqxHFy7eVFugptZytoPLEBfQVSGuayPkupHf1dK7DBfK1sn16
         BF0/lgfzZk5RNZti/yYqWGKIGONWjMdWmVy9ABIkHeGRDHU2IQ08jJPD6OCR12Gga+1Y
         ym3j63lPJanmJLwJStxRW3Fofa/147Pl2dnYRI6ijF3f1FxjwGXYbxyfArYViSFEhLBc
         JmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776330695; x=1776935495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPss4pXYIIOF8fADFf1z6o8wrqt6CC0/v8OIPeDBCN4=;
        b=s5mBOCmpcbfblzFlwIixdf8a0HSBIL4nbVfZEJ3/8G7nKeQw5gE4KZZSWAx84yInl5
         UvzIkzb0bIZulvMk27miV67b1n+iGRnaz3pn2lwDpc6zTbbTPZqpQojUM/BRgKLA16yx
         o7LzcvBxeHP3dpH9d3IgG3LZS87Nb7P3gNdSsimluC56shjb3SL5yji3vvhWZLuc/Fth
         rFXA67Y5wAHN9X1fdlr6W1crOvzlkixcEgjD4YoCiMAxUuC2rRyPRHbJPv7mtYR8llzD
         X9jFxxU7qU6Xv+3SXOriuzLSNXWqD4FkXFWLaLQh55V+qfZqpg7RaeqG3+qe8TegkJs/
         ODoA==
X-Forwarded-Encrypted: i=1; AFNElJ8DqmRz2/fFaK30WlU9gS21+UGq+fmz4qlzfaDrN7j90a811B6Im1SmabY0dCif1SeL5DxGlzG4NkXUeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5m0szXYvsrnTsZFkzIEvKjMxuV7zlHvENJNzmtuLQzQIF7LPr
	SmQtwl7kAIJZiBbHOZVyCi7IG7hbJnp1WHtFLI3wc2fGtq1dfQQmGUJM3Vn2z/MWN10RBjXPbCG
	JCaZiQJ/YAkxT3R2mRnuguKu8/CiUnYHry5hafLg8docg
X-Gm-Gg: AeBDiesC9MiudRpVKpBtathuDdIgoggpXxjJdW764wvocCrjR8SNcgfzDjPSK3Cx7qI
	j1NRSB9Kpz7fz/yajbc2qQNgXfSQTMaWaTurZFAMShWj8pUa8viL3ZPxPF968wtWHTyyDvLNpXp
	GxrLOkgGqJmDe/euOp6AZOmzX5h4tUFQhflOWJWLzUg3+4F7vY0W0varAQOiEAsNxyei4d7t2+/
	eVUqWl7104lrMDKp5kUHn8H5swJiXujN7WGac21PxX/9Wii/Y/hXr0sh+mJygqt6cCEYbed0g+2
	3RbFU1fUerGUDLtFFFuX
X-Received: by 2002:a05:690e:4105:b0:651:c698:fc01 with SMTP id
 956f58d0204a3-651c698fe41mr15283368d50.24.1776330695403; Thu, 16 Apr 2026
 02:11:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415154537.3451732-1-lgs201920130244@gmail.com>
 <75275f6e-8314-4dd6-a54e-95320c2224e2@linuxfoundation.org>
 <CANUHTR9j8-wHB8rE1zGLaUw4ZyNh2Mq3njFerBoUcVPWAh7w6A@mail.gmail.com> <a189c5e7-9119-43ad-8a90-b96cc40fed06@linuxfoundation.org>
In-Reply-To: <a189c5e7-9119-43ad-8a90-b96cc40fed06@linuxfoundation.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 16 Apr 2026 17:11:21 +0800
X-Gm-Features: AQROBzBkyYJEDY-3EzYz4JpmEC6TfTKUR_6PKczImyFVHt3Y9gPZvyypY_TFnV0
Message-ID: <CANUHTR8FYWid_W=Lcd_N0dZdaoTFdxVKJhE9G4QBrcp3rsCiyw@mail.gmail.com>
Subject: Re: [PATCH] media: vimc: fix reference leak on failed device registration
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58863-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,patchew.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 08D6B40C0CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Shuah,

Thanks for reviewing.

On Thu, 16 Apr 2026 at 04:49, Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 4/15/26 10:56, Guangshuo Li wrote:
> > Hi Shuah,
> >
> > Thanks for reviewing.
> >
> > On Thu, 16 Apr 2026 at 00:01, Shuah Khan <skhan@linuxfoundation.org> wrote:
> >>
> >
> >>
> >> Can you share your manual review?
> >>
> >> Can other static analysis tools for example scripts/coccinelle support
> >> your findings?
> >>
>
> Did you try other static analysis tools in the kernel?
>
I have not used other static analysis tools for this case.

> There are several calls to platform_device_register() all over the kernel.
> Did your tool find all other cases or just this one?
>
> thanks,
> -- Shuah

My tool also identified other similar issues in the kernel, and I have
posted corresponding patches for them, for example:

[PATCH] eeprom: digsy_mtc: fix reference leak on failed device registration
https://patchew.org/linux/20260415165203.3584869-1-lgs201920130244@gmail.com/

[PATCH] arm_pmu: acpi: fix reference leak on failed device registration
https://patchew.org/linux/20260415174159.3625777-1-lgs201920130244@gmail.com/

Thanks,
Guangshuo

