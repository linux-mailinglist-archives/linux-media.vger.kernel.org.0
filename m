Return-Path: <linux-media+bounces-64400-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e8dVOjM8KWoPSwMAu9opvQ
	(envelope-from <linux-media+bounces-64400-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:28:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DE8668418
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:28:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KXKnP0O4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64400-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64400-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5172F324FF7F
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE8F3F1AA6;
	Wed, 10 Jun 2026 10:22:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F383F0A96
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 10:22:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086933; cv=none; b=QKeJXX+QrVJ+GK/W2p3rLq8saJhM3WsVDTjf40aJNzWw1LCkB0K4MhPV0eFt5rxOHKnspoWHHdzeFNiAmqFZumXdW8cZC5u9RH9fmlBqrDF5wx0aBNPpxXJHGq+9VOslu7WUmUz9hGLJ04zd3Hfh916dcfRobHTJR/HQrISe0zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086933; c=relaxed/simple;
	bh=/twrpph9VEDz9BetNDO1Ab2Jy1tu55s4Ibr2NcdvEUg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=AJTVjsycnrBh9QQdzf/31uKSIA11X77G+zvpyWp6ctUMEFsHvGLn+V4lORqvXMC6zohCuj2Al6cAT2HeONBAOVorep6PaZl23zzo3S9s+qj7rtcLkjNCa7T57ziHAxg8qPQk3nkjxJeF9gfAwXeydQCJFU4nkOHrHr7LlGBKGU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXKnP0O4; arc=none smtp.client-ip=209.85.167.52
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa68d65d24so7056432e87.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 03:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086930; x=1781691730; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/twrpph9VEDz9BetNDO1Ab2Jy1tu55s4Ibr2NcdvEUg=;
        b=KXKnP0O43wpB+Dh58szF5VzVGPwQn6z632DfRv/i9IvD4Jw18uIypyx4ZW+U3Uv9Aw
         dqOnfgX5JYuboYES23h2ZY7w+PhkCBLLlFLhyVQnQ+MDgf6bh8J9SenzP59wHciGHV1H
         omojuOjTweBZsxME0sP7vQ/tYPznguyu9bWeM9hHLDLMJsLKeQ2MMcOMDXwKgqOXaJLE
         M/cfrsJ9JaOVAfV3ECi7TYscAShwmJU7aiNpkATyBGvdPLBSvwAlOMkh2fcHORr7nnFM
         1tiFwqwTIjV6XEhaBrCGpXCDGqmuxCUr3yjNKbYAtj5769fim7LEUckvKMivCtf/fA6Y
         JidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086930; x=1781691730;
        h=mime-version:content-transfer-encoding:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/twrpph9VEDz9BetNDO1Ab2Jy1tu55s4Ibr2NcdvEUg=;
        b=SrhgosEjCmCpUkTQOdhV7raalffirj7MwE2w+Sdr1FGURP3/Ma2HXUixXjYwNZJYn6
         jdGxvkF6JzO5UldcoWhKoHMgSW7W8EpBAx8UsKSfeTp9IEzmOtIXH/tKAl/xXpiujhYA
         LESm8u6iKMVFMPC5drLsX/k/4dXIPlnPmhFDzsQtgecPziOj/KCfupxTMv+5I+uW9OKu
         qOvRolVnH+f5R1uAIZveiznFM/FvIMAM6xDv/MnIgZQj/lSJPFsUlpmudGbrXfr94IMX
         sKgsqDlgq9G4MuLyss+SmN8eAxdrI1O61hIvZKixHxvbk1J2efxsM95ogEZ+e+WBGYX5
         FySQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QAr+Q2dM1gRBsFxr0AYvYyOXM+KypcgkvTqRqO7PK1H/oFgtRP9CLe4vKM19nCX5bzt1g9sAiTn+5IQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqv9Hcz4NsS03o13EsE+jAfs+fzH/06Rzs6vtb8Fezd2RmaMxa
	U8xMHSBQxYwzk8u3rIfy6Mq/yTrm+Dl8TsXQk4BCFwXd1MLVIiJWa1vC
X-Gm-Gg: Acq92OF35eMJFwsAwiOGh48VltitVbzn+JLlwaUHCEnEzdQalRg6UO1sTptmW5p4xct
	OwwfUzJztcrEs355qS3JHIOHGfSJKhh5V6q9W3Jho77whrwlvCfWEPQbWtuHFPtOaq6el+SObWy
	fXwmMYjrkBzP8COVjFQoLGT8uNvCbFZx9+K864JKCLdWyofGt9LHpM1mtyqXBLDKatvt91AKC7O
	Eru16U52D6tJSartFAXSPcLBPSs+ItsOVajQdDIScfgEx+l1XnVXTUSzeKdRKWnyvIvSaxIWC63
	MpUbg0nk+Hs4pgYYTblJM6ec6q4yDUfyNJ9z11qQ7m8A8cf5fndJiXUn1Nv6i5iagxRW543t5pa
	+zP5rFZV1Aj5yJiSIlf+RgTPRqRslpCZXBsxlRaZDeiUhwtXwOCDs+OyXjR9DtwDo/5LVDDCvXN
	5OJwY2JF5oIgHIDUZLo7TqhH97EHEV0wKZOeDyXT1rQxFPScYmZrU1eAye6F84iUKJ5w/THIake
	bx1bPphxBw4u29NDd/mCA==
X-Received: by 2002:a05:6512:3b0c:b0:5aa:71fd:de75 with SMTP id 2adb3069b0e04-5acf8b8d32emr2100646e87.39.1781086929936;
        Wed, 10 Jun 2026 03:22:09 -0700 (PDT)
Received: from [127.0.1.1] ([79.106.123.139])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed718sm5200547e87.14.2026.06.10.03.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:22:09 -0700 (PDT)
From: Jurison Murati <eng.juri@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: ov8865: Program the mode on stream start
 if needed
In-Reply-To: <0c460027-c473-439a-8493-c0248c6401c7@ideasonboard.com>
References: <20260609232255.13559-1-eng.juri@gmail.com>
 <0c460027-c473-439a-8493-c0248c6401c7@ideasonboard.com>
Date: Wed, 10 Jun 2026 12:22:08 +0200
Message-ID: <178108692890.7090.17187026533594771272@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64400-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dan.scally@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[engjuri@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[engjuri@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42DE8668418

Hi Dan,

Thanks for the review.

> ov8865_resume() writes the sensor configuration probably to support mid-str=
eam
> suspend. If we moved the ov8865_sensor_init() and __v4l2_ctrl_handler_setup=
()
> calls there behind the state->streaming guard along with ov8865_sw_standby()
> then I think they could just be called unconditionally in the enable path in
> ov886_s_stream() without having to store a mode in struct ov8865_state

That works nicely - done in v2, and it addresses Sakari's concern
about the extra state as well. Retested on the Surface Book 2: both
modes stream fine with the sensor held runtime-active, and the resume
handler still reprograms the sensor when resuming mid-stream.

Regards,
Jurison

