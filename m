Return-Path: <linux-media+bounces-61202-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DoEAR6sAmoLvgEAu9opvQ
	(envelope-from <linux-media+bounces-61202-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 06:27:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D36519926
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 06:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14642302BBC2
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 04:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DCF31F99C;
	Tue, 12 May 2026 04:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evZ97ILI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB9F383334
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 04:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778560019; cv=pass; b=hM0KwV8UHAEP0gUmZfroRy+Av4RSLVCKgf1ZKyE0oIqmqj43DtDmvL4KPo/C9yCOSCf/wZNcI8GBBV41SMMfinQW6R+32nUc+QL+I0R045rAub4BRoSw9Pj/qa1s/wDFMHbxxLEYcTboa3OQVFIZd9WjymEovUebBDxhm+cB23g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778560019; c=relaxed/simple;
	bh=+ySoRi6LeXBU8zA55VzU96r7TVruowwBuL5UEALxqcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ndKSVKWANJrRFCO9hpuxLWr/64nLjFbn91vMJ2Tr4TRXZoGJ4g0EmBMXLvsk5KYpD0yUUBTU/kD2z35Mt9E0wp2JcdSaDlIRbgpMsxjxkr26OjgwTuW97VShFEqob1VzX+jMYXzzApohEcP8xkka/va0GRmVhQQr8YIZM0fQTw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evZ97ILI; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67c4aaf76ecso7873157a12.3
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 21:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778560016; cv=none;
        d=google.com; s=arc-20240605;
        b=hcjTLEvJkedjQk3g39hTenHZCa9LuxQUyIdQBRil6lSuPZ30R2q04VN962QbOnhfoK
         ikkQRVOXUaWGoL94IwE5Qk4BOVTDAnZ+folWwQcw8KKFRUzsY8qxZFSETD5SkLEKZ6a6
         Eqxi1LebB07DQx099tuY1LgVA1yhiipwZ9OXGIfQA0Tb9Di7WO44m0H6vHAoJ2bluMDF
         Fk64Hb6W1Fz5Q2UHCwDAtbWL1MFPCxPjW8mU9CCD7BcS9CNOLo2eX5GZMZTKo37bfRKT
         FR1YRBaAqhT8STmcLXuOMWeF+1cz+PnwgBK4CXpUOOOH3F/mIT/Ws0RijaOXGHv5bCQk
         aTZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+ySoRi6LeXBU8zA55VzU96r7TVruowwBuL5UEALxqcY=;
        fh=LTDF8u0BYwOeEeA4lpbFMh0/aTpGxkaQdI30saeIet8=;
        b=B3cOv1DOwb5uRR7mS0d7hdPMCH/lqk7qKXHuB5FQczsA8jOPh5usvJvjduqigWk2oY
         Y1tpuWFEjvxc0Nb6LBv4RT5vts993Gs80GnwH22GgPZM3yQ/23UDB47j7BvxkxGTdrwv
         IKaSs+cQsi4txMpcQ1IWidsrQI+pwT75RTAc8rGJJzwdfN8YT6bzZGgFKDrL19+hYCaT
         832PhNQa+8sqLP4pBzYjWO3TetxzteHXCeMuHfyfG46NpvEDN364dTNYhd5P86ZxmrM+
         lSJf4EM1faLhRYBj9mYQlkAC+PzAvzqQgSskkadtZQiCMoMpBNZvyFoisnBxycm1DncJ
         vKpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778560016; x=1779164816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ySoRi6LeXBU8zA55VzU96r7TVruowwBuL5UEALxqcY=;
        b=evZ97ILIMw6VaZsMMn58jGVSO4kuI/0CMp2jgxydzGeJZDEUNJZNNgQEAmW2AkTZS5
         YjafRZ6tjhiY9lAi8LNU00nuAptNNAJxUX+it2/5KJZYn32R2XQ8AgaySxeWu5uVWWCt
         jeXbISSrdDTa1jEnzcybMgNS201u91AA4uE3qY0aHtJaBqETZ9zwHF+rzGds23pYDHWQ
         7FKLafXyapnpf1ofvfp7YhbJ6ycOjjdBeRUaIrImwvKN3JInMADpo9eDPtC3u7vR/0nl
         x2niTlnv0Yk5wC7yKFH7HoTicurUcfYH6WyTLeQxUJZzP+9wPbfKvTDsGuzpwUEwVROZ
         mNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778560016; x=1779164816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ySoRi6LeXBU8zA55VzU96r7TVruowwBuL5UEALxqcY=;
        b=EJg6Yz/tRl2AXAtsIqAlZU7EW/PRONSPyBX+RpiKXzdWsvZ+xfDrgmDehCgZ3ZdjAO
         d4ISiwqNrA0QXvs6Tfvkno880rcPAmIqDOTklxkuHWYuoRfyllS/q9a/gDDrjAdNcF3y
         NKGt69IBSDe/A/QDhCEzhMIaAXo9b/1o6xrLC79mCwwjk2vS71bHgAZpXhkjperiJkZs
         gkf+Mo54uL4u3p3XvnhvIi83mvbyS8/j2x1p0YCDT+Qzw7j8gtJBOWJYymK48BgkF7Mn
         CFIVN62cSC/SA7qd9DrUtBC8siJgzBt2rn+sN1jChslVW64rjD/jDPbcJMF5aEjjLodd
         XkEg==
X-Forwarded-Encrypted: i=1; AFNElJ+LK3IyrmjcI/xbtF67faEjkx1W3cW4bP1uUncmS2OIPDNaJUlQWBDc9sKNpXbCy4wJ+K1AGPM9vdwE/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwarDuk6AJ2y+fiMtObX/4HGRQsyR7vUlCoRqKdOHhUZyN1U1ww
	hXjhpZZKC4yApUZJ1RoyxJcogBgI6zO6+20gKjTy3wDwnYHMOW089wUpJ9s+2U+UDFSNlQIbkAS
	fOjZ/hnuFXu60mfca8rQPTeMajTDL7N9AYioFyPA=
X-Gm-Gg: Acq92OG/viXVaf6WvHaUEeUkAzBtYM2zYXff6pHPa9iFj4soGkmcI22OyRBMZBPtSYd
	2v14dAq22ovhzbMeLTm5Q9vwKoeGV/Kf9VO1Xfh+Cm7OX1udkVJF0HehhFCE9ughSh0ObfxyiDP
	VC5DG+cg7Po8Hr6eRwyBF4zw4S3lqpkFHMNRvtNcGOUdgoy76scW+p9jeqYRw7bK2Is6W11ZeoT
	ADBQw4t1FkrBFlLLJ6pbA9fOSEWeP/47Dpa9gJY2YDUH3fEBZGPB1MC990WIs0Zs+6sJuKFdU94
	t5lsCy7y+rXohQVrlEkuU67N/872GnnIZdp1fdmVlv5tdjMmRJdLkeLf5Pvs/9knybJUyMbMUmW
	OLFLrNl0=
X-Received: by 2002:a17:906:4787:b0:bb4:92dc:b84b with SMTP id
 a640c23a62f3a-bc56cd3782cmr1545358966b.26.1778560016349; Mon, 11 May 2026
 21:26:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511193222.49582-1-melihemik@noirlang.tr>
In-Reply-To: <20260511193222.49582-1-melihemik@noirlang.tr>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 07:26:20 +0300
X-Gm-Features: AVHnY4Kn9Rv-3n24WJGHghzuyLr222ljoNomIq2KvZY0XGkSQ0Weq_cay6ZEOcY
Message-ID: <CAHp75VebM9wwKpjnZKEGVvwA=TfmF4MDDuYssNAFWDnXsXyRTw@mail.gmail.com>
Subject: Re: [PATCH] atomisp: remove unused module parameter dbg_func
To: Melih Emik <melihemik@noirlang.tr>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 63D36519926
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-61202-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 10:32=E2=80=AFPM Melih Emik <melihemik@noirlang.tr>=
 wrote:
>
> atomisp_v4l2.c declared dbg_func as a module parameter to expose the
> CSS debug print switch at module load time.
>
> dbg_func remains as internal state for the CSS print environment, but
> no code depends on the module parameter registration. After this removal,
> git grep only finds the internal variable users and no module_param() or
> MODULE_PARM_DESC() entry for dbg_func.
>
> Remove the obsolete parameter while leaving the existing default debug
> print state unchanged.

While the direction is good, the patch is half-baked. Instead make
sure the similar infrastructure is available at runtime, exempli
gratia via trace events or dynamic debug.

--=20
With Best Regards,
Andy Shevchenko

