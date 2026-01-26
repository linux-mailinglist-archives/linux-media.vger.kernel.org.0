Return-Path: <linux-media+bounces-51559-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lHHKCBJdd2n8eQEAu9opvQ
	(envelope-from <linux-media+bounces-51559-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 13:24:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 812E188285
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 13:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD7E43014105
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 12:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1E43358C4;
	Mon, 26 Jan 2026 12:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLz3YAmu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE47733556B
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 12:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769430285; cv=pass; b=nJ1e3rB4ulm167cnWjqaoN1Fi3Ui+bEPlc55p0FZiIH4R9gPAi/LT8UYxbd9+cZ810esN9gGo9xT5siSDD5RbYzCXayBhGzOdUTiO8hl5paL53uZ3EgJ62i1HpCahur8RgLxcJJg9VzMOZEaYm2XNchiBZmfovCxrykww60h/u0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769430285; c=relaxed/simple;
	bh=pzEneNpTk24st2dNwgbOBX5hZQcJWkd60X7CUk/G2rQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LW9bmWDBLxDmDcu3D7WEqZcSiS/ZcoeP4t6ktIDGh3R9+flJmEFS4GWvCyVilWbPM+Wg1ozISUwZCiYO9XzHOu5XqI8S2dwTQzRhyduI39d0ZjisOTj/sz/I4nt1ngaJeQILeEdMcrtT3hpYCYC4MjGg3vEpAZttUBSZmYpYxlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLz3YAmu; arc=pass smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c56188aef06so1730226a12.2
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 04:24:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769430283; cv=none;
        d=google.com; s=arc-20240605;
        b=GEueVrYCPuCaMn/tOHYMhyf9hnnGN6Snv+TtW6iTuQtQcSKWNyIxo47Vpks5EYSe3w
         cj1w0ri1NvD39Ek782YFdJW1mrWy6vRwThw8zQ/Px8QnTX6QVuLakioIA7MaO3y+zRcn
         5GDh/+o/FJh+9pxyj9JB2dDkfkaSm2JBUjzOU6bh70kE0iBLh1fBFep9YJa7pVIrKT0i
         2kAPow/Kbhi38WIipELUV1zIOsP9fAJDbQqpy+WS+D1pR4eX5qp2luqzwQbfQSfBAwTk
         Uzgvdi5SG0SiABsEFKWnEpgGQREqDBlLJ2YbDFmOCTMfVPa4ERgYoyhklC4MsPTDEvQG
         RzRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pzEneNpTk24st2dNwgbOBX5hZQcJWkd60X7CUk/G2rQ=;
        fh=ijx6cp5Wte+q0S/R1JXRUE0D4YzrTkr/IcUoULgNgLY=;
        b=Jyp+V8+hN+PguoyluvOiaFQiKaEXSuqBsvYc3LO5s3n32E5UMUWN8bibOxcLHORz8H
         AOzjO1aYcgMjB4G/mQlAQkUx8JjXXkMztf1be5e7HZUG4Zv3ZNuEzaOTpJJbYMt7R/yb
         zucBdpBbNpD2QusE2wB1LuugS3mguvrC/QJzNVIpgEKuS9OQ4OmFpA8W/ooIQWlwYUyu
         gSjmipVh3ngcqMLHNrv2SkiNIuWtQTl35Wr6vfHRAMjPYWfgYDuF6JDVCVPp8cRcpO0Y
         DEvK2/QOGpZVaeoA/k/ALB2ediFSxln4pHSaPEjbOFS+r4e0eWjeFnYiDrtaTYdgSE5W
         4ZBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769430283; x=1770035083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzEneNpTk24st2dNwgbOBX5hZQcJWkd60X7CUk/G2rQ=;
        b=iLz3YAmuzSnCSXHanRGXQqHDw18UU7W/Hvm2du6ZXz1x7IA2I0HAQi6ck2hLJOOwX7
         4gDB46312Blh7ZDvF6EPC9XbEY8jzlNWj+cSFICCdULqsXtZji25t8g/8X7RU9eFLoZO
         oDUL/iMYXizEIZPSy5w0HDhqPofzi2uacWMsEqkkfjRSKMp+c+kPYEY0UxkESV87BeAY
         PPuLa8LgYmhsdTEh63tGADiMcYSMdZduKz9QQ5Ffm99ERXlhzi+R8fz6WhMg+0PCsDoF
         86IiCfG7ENpe11vnd1RcnU2fzC3WqtA6BoOAiD2/r2wN5TQvEzVgWIHYv4MVqULrvpns
         LThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769430283; x=1770035083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pzEneNpTk24st2dNwgbOBX5hZQcJWkd60X7CUk/G2rQ=;
        b=XuqAf9J43+l/BuAp+bT96p2nMOuZdRPatvlZC5I1fZF1UoDr7mIqcTwMsLDIkrSwzX
         ymjBhwY/+q1kwRgwdKcL4r9UkPt6QPFm+0mp9F3sBvJ1k4XECfHS8s3d4vjsQC+pYO8Z
         05/anz4NICVt21JOhH2UXqFq6OeWIQPvqocpIKFgZQW6ACSbVbBC1Y+hKhvjmiXKZBC/
         BFNhvZ8FdOwoZfhP/1NOBp4TlIBzhi7Z/uvYygF4hVcJ+YfiXkI3L78fwKEDZrky4NN3
         I9psem9uSL7yQ5iLSvdH73gW0kbhml4VlxInLUmGQA/eSuzKvpfB36hKPsXR8HSMt987
         hyHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz3SmHT8BUNQsduyPx9xBrKDrq+hYmHFHo2huwBh5xowb1VfVP5ykrOau/uNelIN1UuFRYSKLcTEpWzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWBwius5HYIDxpD3eYIJE7ogVUFeqJx5AL7UvRju8dfEHmKp9z
	op0lI1ejIrFShCidALiJGf5z8oCHvaf3+x/Z5hH9zXVEiKjL3jdOvCSaylYcqKHDA/7MgejTz49
	xeGAiKuGdY7F6EeF7amexJpPkQ1g28vw=
X-Gm-Gg: AZuq6aJ1R9i1YdPTApqUc63BgpPc2Ud5uV6Q40N3m5TLo/oqtd7NYIXhWNdvGWpXR/+
	ucsKMEoo4ZqNA9ik6LCHpOpKcf/lAHkLqDokZzs3EVdnEN9MCZNxqiM4azF6/rBEf885GexMoQe
	JzzQV3jxlo53muQ+9jzFjkctzKxkwlfbGhg1NmNZLOqrUIXgIC0+tg5BcjIz0MfHc3NPO6uUu2M
	vHa81EcN+o3wkuhaWd/EItImHt3GLnrYqNMHv72WwiUOJmWQ0uv5DvcPVSxQShyX++i7EFMnhJr
	sWb54/MxRepOL4j6hO0huZ/HEhZ5
X-Received: by 2002:a17:903:246:b0:2a7:561e:690c with SMTP id
 d9443c01a7336-2a845282b8fmr33020475ad.27.1769430283160; Mon, 26 Jan 2026
 04:24:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125171745.484806-1-bjsaikiran@gmail.com> <20260126061528.63785-1-bjsaikiran@gmail.com>
 <20260126061528.63785-2-bjsaikiran@gmail.com> <ef6cf6c5-3b5d-45f2-af67-0567262a4561@linaro.org>
 <CAAFDt1spRkj7kySCa8P=jehQHbYVT2j+nxLira1vwYkiCJ7LDw@mail.gmail.com>
 <b699fcf5-5cb0-41eb-b9de-e5c6e98aefaa@linaro.org> <IlpLwcSSsQ89AZYFUkWtRcUkztg6PClgkVOyWG0StiDOUCE93t7KlF9q18JPi3GutJ1OQWj_2igjYq1OD8FLZg==@protonmail.internalid>
 <CAAFDt1tjiEXbuChcY73+NYxPW=rB83P4Bks1TPGsHTTqoSzOuw@mail.gmail.com> <ed1421d9-f094-4306-ae6d-e07b3a72f82b@kernel.org>
In-Reply-To: <ed1421d9-f094-4306-ae6d-e07b3a72f82b@kernel.org>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Mon, 26 Jan 2026 17:54:32 +0530
X-Gm-Features: AZwV_QjNdCq-r5XwMpcjdCkf8_9YDAdSFKTs6hBD0gL-ZHCx8M9dBvql7jzyq10
Message-ID: <CAAFDt1ukAdXwADuFVoZrs6Ay2fB_sq6LMW5FCnsjqUL7V62mfg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] media: i2c: ov02c10: Keep power on and use reset
 for power management
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com, 
	vladimir.zapolskiy@linaro.org, hansg@kernel.org, sakari.ailus@linux.intel.com, 
	mchehab@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51559-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,vger.kernel.org,kernel.org,gmail.com,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 812E188285
X-Rspamd-Action: no action

Yes, I implemented your suggested sequence in power_on():

Assert XSHUTDOWN (Reset GPIO =3D 1)
Enable Regulators
Enable Clock
Wait 2ms+
Release XSHUTDOWN (Reset GPIO =3D 0)

Even with this sequence, the brownout prevents detection if the
off-time was ~2.3s (I got this 2.3s number by conducting extensive
stress tests on the platform starting from 50ms to 3s. At 2.3s the
success rate was 100%. Anything below 2.3s, the sensor entered a
brownout state atleast once.)

Thanks & Regards,
Saikiran

On Mon, Jan 26, 2026 at 5:36=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 26/01/2026 11:58, Saikiran B wrote:
> > "I don't think we've established the regulator is at fault. That's the
> > feedback I'm giving you here. ... vreg_cam_1p8: regulator-cam-1p8 {
> > compatible =3D "regulator-fixed";"
> >
> > Just to clarify on the regulators: on the Slim 7x, the camera supplies
> > (avdd, dvdd, dovdd) are all RPMh-controlled LDOs (pm8010 and pm8550),
> > not generic fixed regulators.
>
> Slim7x - not the Dell right ;)
>
> > As I've confirmed that the qcom-rpmh-regulator driver doesn't natively
> > support active discharge or parsing off-on-delay-us (generic
> > property), which explains why the physical discharge constraint wasn't
> > being respected.
>
> No, the RPMh firmware should know how to do that. Not the Linux side,
> this is the part of your brown-out story that doesn't make sense.
>
> BTW, did you try my given sequence - particularly the XSHUTDOWN in
> power_on(); ?
>
> If the XSHUTDOWN pin is for example floating or not in the correct
> logical state when you power-on, the chip may not initialise correctly.
>
> Which could lead you to conclude - you are having a regulator problem,
> when in fact you are having a sensor state-machine init problem.
>
> ?
>
> ---
> bod

