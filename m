Return-Path: <linux-media+bounces-57550-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EORHI9cqymmQ5wUAu9opvQ
	(envelope-from <linux-media+bounces-57550-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:48:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB047356A07
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08451302AE28
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 07:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8193A8737;
	Mon, 30 Mar 2026 07:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T67jEG8F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28543A7F4C
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 07:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856841; cv=pass; b=OxEYRAODHpC2qSCM2Bw6MlcA8YxqlnDaIERl0xpXBfhooES3HqGGRmAlVsiKfO3HkhpAoiuYiia3sn7OnigmJCPxg9YSJBxdMEaOa3fHue6G23vx6geDJDkXKz0kM22fVzrLZq6K2dSbBvuoXDEQRDxR5WYXnahJJOYYbsnqtmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856841; c=relaxed/simple;
	bh=utomh18VVNFCmFdz9xSYL8o5VlY6b49hsxShVKFI2u4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rlh8+TNJFAgx/iVZjewOHK4GZV+et+kNEiLRTFgMpQo1L+csLRimwt/fYCz2j+w+En3Qq8j5HZUVneciFoLKmZRk9FmVlQ58zaSq6eueCvfr13UPPRbG0FlMD8OkIyHtP+k2ob/GOI8OPXZKi9HyzWX5aTNp2Vw8AbSOrF9rc68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T67jEG8F; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a2a70bb66aso3979722e87.0
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 00:47:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774856837; cv=none;
        d=google.com; s=arc-20240605;
        b=hNHz4ARByN8+FbT36MsZfQJT+yJNcFyQl6tq7zbhdvzZD8hSZmYr3AJ2Im4W3kydAg
         EDi8kggwiN5hyZ8Hig+aD98QKaq1sCpU65Ar+JdQayZ1mANpnHWv/omNm6Bx0G2TI6t7
         Xhwr7C5cqfkLdNoZtJ3EhSDOeNZA7l5Ah4IeMFwTGq9a1SLwsmX/AfSWxFqcyATGNkSd
         H/s8IOyyBCiy7RQ2c2gmq2Ji7FrBFRxkYLx0wsDwj3e1zTEp5ieHYVciHX1IZIU5g5pm
         /0Jn/bJQQl/eBlMQCcIiOqoFK3prq9enNlYgLnW7La2cUias1UjEgcwVQFdn4fl14Ff0
         fmhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=utomh18VVNFCmFdz9xSYL8o5VlY6b49hsxShVKFI2u4=;
        fh=5etZ1P6OcbRWpO33x1IrdvkHiJS6qFmJvy7WwLSXcNg=;
        b=lItxWaSlXaFog/3oGV39jebM4BYEt14xMDXFnU2UBOdq6EgwiA2s+y6TNT4tFlAeJn
         DWE0r7rp8ojQfmrDPyBhn4VTc3CM/rysod+292gDT34z7wSF5EyX18wRZNoizoPMB/rA
         3g5E3jc9uzop+TSWAHn9K4pp1FAKpm8nEwcQik14cRJG2uYw54mluB2YM7+/EkyKK06M
         k+sTWgj42bfOGq3tai7KjOwXWGec8AN/sOoKHeIRHKD70tEN2w4YSdBhsT8s5sYLaqEr
         eysgyHNlH6XVsEZIAX5ShhCBJs/Pwcr10rfBrbXERFaNDqAPwK87huWJ6SFFU7iHHsA2
         lGDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774856837; x=1775461637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utomh18VVNFCmFdz9xSYL8o5VlY6b49hsxShVKFI2u4=;
        b=T67jEG8FT0KrGqXhnMZUtl+QcpaDzD8rVbEGFVKCzuWfDXMoumKVzAW78fJmds8GOZ
         Gy71WDPqdUmEk5a5u7JKUijhJLLsbK7uqfDDQCz5H3A0rzT+H5SkLadI5qg3wQwxo11O
         WtfLFSTNlwHGE45M2QUTBOrFidK9HVxPRWVBiG8+5RXK7Q4PuvImUmbJnVFaalr76/+r
         ZLNuAgJ1RuKvQ9iBoi04GVkdWVTMGNBHtVVx2LgQCIK6WMMGDCoPsMCdzPLfb2qJAY1q
         AEf+6Xpzbu2EeT4HLPpUgjGlU38S3dYVntg45TOgLn4F0G9M+cSz/HnPL5WOOvKuetaw
         +EoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774856837; x=1775461637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=utomh18VVNFCmFdz9xSYL8o5VlY6b49hsxShVKFI2u4=;
        b=N8qBjoCVout8y9XIeX/QfMXJscdXTDBxZoPtjk26sJ2YA0EIt7MYKsfzybOmNc3Pdj
         GRYbIXGTRaXL82LtvX46GZNYv6++0EyJ/vjrUQA9R3sJwnU/Yg3tw/fTozpOzMGeXwh4
         /KbmnMKlPx1BtS4faUUCDb7Ce95TABikRA99XcCgDGLvYcNFWJgRaUYmqDw0gj8ok60B
         nUJ3nKXPpRpk1I/YN+G9qduayfCr3nm3yNSjn9XMwbWwp4vxMTQj3i8mWkuy+WgZUYj1
         YXxlPzeKWA737F7W20fuGjeEUVp2WCYDQQMXGPdueyNcDDvNaFTR+2Lr/uvoavRLT7CS
         VHbA==
X-Forwarded-Encrypted: i=1; AJvYcCUfOFvoQUQPD7LY+Tz2AfdiOI9yqVWLvS+mbIuJuRdEJGacq2O6GE2uFVMGamlI0tXe+2hCmdAc+nVj7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZRhKS1Vvw9D2rG5FruQ8EGgZ/faO0VeqO9ZvYAqV6uStztJY4
	Exo1Jke05xhEnkcfU5yT6fv3zTNgjn8FQTUxuqFuNZC8nOq1siIA24TddPkrCeqgQK1iJyuJYm/
	CqoFWlfALuAZA3TfozApATCkbAZRC70g+6YmYM6hyiw==
X-Gm-Gg: ATEYQzxeZcW7Y5ejVqesZRImE8eMQOukepYKAiV01RUpKbDJmMdwS2Y67j2GF0ZjiyN
	w6DU3aIbM6UpS6IAwEiBifXx6WsOGr5pMKY09yHDkWJh5OJLT6rRtTaYJXdnMyvt94+ieih+A8S
	qVNRz0vyi0GXwtaHpAit9K7rJ3CCF3FYKNwV1UAS/1+DHvo8WVX2Eq4oY0Afa9vuPP6iS1Ngsrt
	5xNAsK20wq1N2TMFwWx1VNjmpw6l7fNuTWwigEHvVKdyZ8JNrGkZYMsVOxG9xR6U6ojMCIaSaWI
	WIT7Wv5FlM1P1DM66CzhtkD0OEuuJXbv5lp5nRb3
X-Received: by 2002:a05:6512:3b2c:b0:5a2:7b95:af0 with SMTP id
 2adb3069b0e04-5a2ab920a31mr3613277e87.25.1774856836706; Mon, 30 Mar 2026
 00:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113141248.203944-1-marco.crivellari@suse.com>
 <CAAofZF5k1SO-RwfgZMvDTxJ2Go=NZuPEeGFM8gF==ZQzh_SXKg@mail.gmail.com> <b38d2d08-7ee3-4356-94b9-d9c885238cbf@redhat.com>
In-Reply-To: <b38d2d08-7ee3-4356-94b9-d9c885238cbf@redhat.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 30 Mar 2026 09:47:05 +0200
X-Gm-Features: AQROBzCTwbD0tDmtpCPVAXBJUGe-STavyIONtOcRVkb6niI5MU4SLvMNhLgVsko
Message-ID: <CAAofZF6-8Me8CeVHy9YSqQ9n8eTqXt_gRB7EZm5Wnd0zghsz1A@mail.gmail.com>
Subject: Re: [PATCH] octeontx2-af: add WQ_PERCPU to alloc_workqueue users
To: Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Sunil Goutham <sgoutham@marvell.com>, 
	Linu Cherian <lcherian@marvell.com>, Geetha sowjanya <gakula@marvell.com>, 
	Jerin Jacob <jerinj@marvell.com>, hariprasad <hkelam@marvell.com>, 
	Subbaraya Sundeep <sbhatta@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57550-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linutronix.de,suse.com,marvell.com,lunn.ch,davemloft.net,google.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DB047356A07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 7:31=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
> [...]
> I looks like the above patch did not land into the netdev ML. You have
> to resubmit with the correct recipients list and including 'net-next'
> into the subj prefix.
>

Thanks Paolo, I will.

--=20

Marco Crivellari

L3 Support Engineer

