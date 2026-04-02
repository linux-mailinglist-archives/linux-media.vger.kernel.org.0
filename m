Return-Path: <linux-media+bounces-57923-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFivA7QZzmlxlAYAu9opvQ
	(envelope-from <linux-media+bounces-57923-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 09:24:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58953385193
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 09:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FCD5308A979
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 07:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88AAD38758F;
	Thu,  2 Apr 2026 07:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpgrkSsR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41F526C3A2
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 07:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775114197; cv=pass; b=oF5BgfZZwZBm1kT9Kae6IkQSyISltFK9sXi1N1nWSjzX+3AEkYCW28RnUq5/TKsCZe+49aW3/o4HysEMB+A2eT9IANKrGwEyw5s+chZbg4t8R/wuKhKvuoBHHY3YbC6PtG4a3mQZKi4dD2Umyw8qm3wAAZ8Bfxq1g2yP12yI/q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775114197; c=relaxed/simple;
	bh=UlmRQzZoSkVk6B9A8vC3x5DBXeEaSQAOKOfjWHeXQwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJ9927rguvnhgaLQBmPhBAaAJNusRhxxJ1ir8I9ah92WSbh3clATQjEqt/ur36+CyR4Wdn5+hBfKz0bgBUQdmoFnJfdxdotLiGq5x5fI27mTl1Z91DG7tRYC9YZZWieh/JgnowY4uNktS97FHz84l4nUZ4/WK6z+WCJI6cZETv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpgrkSsR; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66ba9898ae8so2841465a12.1
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 00:16:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775114194; cv=none;
        d=google.com; s=arc-20240605;
        b=bqPO/GoiwZeXEOeYCLT02nDHcmkRBjcg6qButLXRwUvWYIgljM2Wu2+e2ViWzpYAW8
         tOgJ2Zkln7D/ufpx88YRGDKdguYNkkWWUhPqEm7z9iv4u6WUjwl9hF/g8es2IY019Owz
         +mF8CaFSH583juKVsrGm9yx1N1sfWWAbaa1Gcvs8Vvedt/Bghn+7lqu/P4wHWtAyd61J
         nla3TY2vM8gQeQ4FMZnoHPovH30FlC4ta7UcvSspgpd3ip7c26cDQcJNX240B0heqX8X
         SWzD2B3AXJTV8osNi9UsfU4vaCyKT9x9p1QuN9gG8qlSg0TVK/ZSpRk4N3kFrF84DJSd
         lGxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UlmRQzZoSkVk6B9A8vC3x5DBXeEaSQAOKOfjWHeXQwI=;
        fh=4EBotZrVBaiZlGXVr2N+K3jcHQburrSx8NyFZ/C6TN8=;
        b=IgVoV45r2wYc24ZDO+e260sXkKUXuRg3HPUIH3LbkuqB0DARNvOWRc4aLgYAYjTjaz
         5NhwbJeTiqAj+2/4CI7ztJKiTUU0XJdkdOIUfv5H/fX/9SBvCQUid4HncXxN0I65gGLp
         ObBeBAnb1VUqPrKIHgvQUPwlcvAweWiq4vsVuexQBbBLo33J2m+5MX3C56ielZlvnEB2
         G8kSvcVcRDGy+Ru8riO3BEvh0nxGZjQ1XgJufBXZptgFizvZ7p4RdSVY7XakWSKvmhi3
         EEs4zkcz1hQokrBCwBb4/iGJf2C1Y3CSVNgOWLlZQzO/FiQ9caG++73289w/+wGhyUae
         ZuKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775114194; x=1775718994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlmRQzZoSkVk6B9A8vC3x5DBXeEaSQAOKOfjWHeXQwI=;
        b=JpgrkSsRfQgdv+4xsyhkylR9aAIrrm0E0pAXgSXTC3KrkWO3KNZJZ1+QWfxpwoR8Bo
         eAmcaaVQNwg7Y8VYrf1Btj5Ax1UIHOLeWA56BLhvVrtz2udz98xuEeK+hVhCcFlpsu68
         afvb7cs920UdgGGfXBuDRoCHE0ChkUGhi0GUjNVBYU63KecCBzShg94S3KrdI8uRHVGO
         oKVUzLyDHsOrO4F0PCIYTXX8QULwn+2RiWevQXX2mKy5BpQTZgZFj3Mm98akoyGrivrq
         Se+gvAEkCFoHmqEQFTkqnzjv4pfarbk8PevXGdT225UJjE+V5FN3Hz5w+kL+sbqs8qhL
         4p8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775114194; x=1775718994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UlmRQzZoSkVk6B9A8vC3x5DBXeEaSQAOKOfjWHeXQwI=;
        b=otK/ESKoUd4Z0AxP0ZuXRA+l9mojyUIjL2f4ZzSaGuHhYbaJanUzrFhV7VKR0ro56/
         rs7QugH5brOp3GsLIsk7kQ/cm/m2APIapE8QhpK8VOFzpgDbTJzcJ3ptw8xCFJp9bdSd
         NaVyYZcNNuC9aA3umESNv6t4MszZ2LLIZq7UuZtsT+z2Snq5vsVd87ukuMe4VgIC0dmS
         HfzIJX6fQdIj8oMgCF4MHhLB9KiAqMlBPZUG2+Xl7oskxEUqgJab7u0Ult6nv3DUfTFu
         Wf3xhrt2EVTVBzlCWEbg9eq//KuyVPmVJqnDyUo0NG6+eRmG8iVLTpRbwvwm11VmlKan
         LLfg==
X-Forwarded-Encrypted: i=1; AJvYcCWqlh2KwD+UfMv0EA9xDS4mHopIme0k4LzQk0RjcyJckUeFh4PQldOCgcUqRCfB2kUdO8+FxnusFIwr2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeOmd53nknXqSnFF0SEwPaqJ6+CTcbfuQtcFOnCVetaPN4M0FQ
	JRVJ1zANHke7uvz37KRCvuD+AVdCZYHghtkq3CZMpQma4uFODYoO9ZSwLWUs6C9nj4pFpXwJqkQ
	XWbpEEnkItA8n6/rLeGJzHf1A4cUhI4g=
X-Gm-Gg: ATEYQzz2Jb+KyxdcZEL6BtjnfOF9KS0SW0aiY5a+DcUinC0l/xDa32Jfk41vzD8hbxE
	TJ9HkOmyS8w5+8iZKFg46sZDRzE9Wkwa63YNU9/MT1AmwmiRl+tYrZusxGus8fcrK0rkdqam/ad
	s+rqyQNbMA1LNdymrSmIzzOM5Zueni2NIqAZRoFW+iLE+rPDLZ3ED3G8XwDo90MAl530dCAiPMX
	1f7whwsu9IjC49xRV2fkd7WvDI3xp9XfL4k0FKwnuOYlD2ro1eLKIUVDI6ppx0pq7YaFKZv4Y+a
	J9jQ8CYdSuN2qdyfmw96THAfpPsbjfK+SJfY5iwvf1DUo+F74VvVY43dh2DfwJ8s5cF60bJh3A4
	V8+YeK/0=
X-Received: by 2002:a17:907:961e:b0:b9c:cb1:a61b with SMTP id
 a640c23a62f3a-b9c46f7ba51mr69096566b.16.1775114193903; Thu, 02 Apr 2026
 00:16:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401170218.40504-1-sairambandikanti@gmail.com>
In-Reply-To: <20260401170218.40504-1-sairambandikanti@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 Apr 2026 10:15:57 +0300
X-Gm-Features: AQROBzC-XNOFeskRa4RPmwY0bcIlMBT69RJ-HZe62QqlWjCQ57aJUzS1RQ2vFrk
Message-ID: <CAHp75VdwT7tRPhzyHdsR+WyS7-9NS9bme2cGrGfc+p4X6wykgQ@mail.gmail.com>
Subject: Re: [PATCH] staging: atomisp: fix memory leak in sh_css_load_firmware
 on error path
To: Sairam Bandikanti <sairambandikanti@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Claude <noreply@anthropic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57923-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 58953385193
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 8:02=E2=80=AFPM Sairam Bandikanti
<sairambandikanti@gmail.com> wrote:
>
> sh_css_load_firmware() allocates sh_css_blob_info and fw_minibuffer but
> all error paths inside the firmware parsing loop use bare 'return'
> statements, leaking both allocations. Additionally, when the
> fw_minibuffer allocation itself fails, sh_css_blob_info is leaked.
>
> Replace all bare returns with goto to a common err_alloc cleanup label
> that frees both allocations before returning.

NAK.

> Signed-off-by: Sairam Bandikanti <sairambandikanti@gmail.com>
> Assisted-by: Claude <noreply@anthropic.com>

Please, use your skills to investigate what the code is doing and not
blindly follow some stupid AI.

--=20
With Best Regards,
Andy Shevchenko

