Return-Path: <linux-media+bounces-55953-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAUdHDVCuGnSawEAu9opvQ
	(envelope-from <linux-media+bounces-55953-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 18:47:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1242729E7F6
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 18:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 823E13022984
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 17:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BD93385B2;
	Mon, 16 Mar 2026 17:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="w2FcOoHj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0220E301004
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 17:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773683221; cv=none; b=JzPYkaUxyunULvWV+PwH2rrCNt755AL6OyZWheMnUAhtr4uPeyy5RhlDcVgW6U9hZ7DD12EWJ1U6rW5Ppv3hIO1MGx2n/XKQgIwyIsn0YxC0O3hvUHCckExAl95FEKnGWqlsqAthyKY7CvavXJLTieoUn2FUr6hgE8ekwUlojBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773683221; c=relaxed/simple;
	bh=Cn2A2nwp3CxXNx7PTxEJ+quj3w6bCXaDvLp6Ft41wI0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oYah7sJ6J8yNeu+pXnWUWImK6FazzpeNv6qgQMdmw3Ar91cJKjWfVlJ4OGFk0hESAkUQv76OH7UsIo2z/lJfvz0IQZW87qGlilT4aHgdKSFhu0MByjtN2iCSgEuee7rtEZXIUzH2fumngEzmGKA0uKc2oSaRhg5wHvqoKHxaM9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=w2FcOoHj; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-506362ac5f7so45991821cf.1
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 10:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773683219; x=1774288019; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cn2A2nwp3CxXNx7PTxEJ+quj3w6bCXaDvLp6Ft41wI0=;
        b=w2FcOoHjhIcv/hOv13V1mhRCI5ey/S95ARtD7Be2qltnJiBWc3HsFBpP8kY9f8IvHv
         nrfmJHeEgGaaf1ZtEkNH1tYOqmMvL0vkC4PtOYyjcDXmgP2waWz6cACFljQaKYlTFIVC
         1uNdjTBhgJ9ruZzknUJ5eTAKRWw39yG9siImflXnGObZ59ZlC9INBuMJhkP5+W7vKGnJ
         LGvMYPaMo2ch7K49ZAiV4omAOXBwIyHdn4IMvcDdiSHRj1ByPG+Ju7DrO1jmCedvIA0b
         h2k2EuCeZlbAhNn8aqWwY/vFUyjfsxtcQA3NPKOF2nINEBqOPdk3Q0h73a7zvzQSg3oj
         g5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773683219; x=1774288019;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cn2A2nwp3CxXNx7PTxEJ+quj3w6bCXaDvLp6Ft41wI0=;
        b=B0/W2q8xDnBm+dm7e8svBDo1oOpSUSDN4D3Yj+bnswXiBvQuf4/W7mH1bK+Q9r1hdY
         4MoA0x+VVrdQAv11471ELIvAKA5PBtDUR46s2OxUIdMHL+xnHQ2bYOH4pXdUtMkWFE6i
         RV84glXY3cZeri9xKjZi//GH9ni2d69c8IxDq6Rr8IyYG6DaWLzMKmh9Ppn9YY+WO9pC
         qtHjcFNc2qs1+v8pQjzLw1f8iK/PJnDRn+IJsg0kfMQKijNiBGelpBgmmubflTw2cVRl
         6A1TtyEM3HSrhzPc6j2Ghsaq0tELBrVLeOEJ+OOxnFlDf+UPZabRKwLqI1nm0Pge1F1m
         evVg==
X-Gm-Message-State: AOJu0YwWyarODcQPmNR1refKC63kmdnPZF1pgH65KggKt3vyUjisH4Or
	JDbojVLtjE3FhZikpiYH4VarUeyyvMRQGhf7dkuF317sRfcqGdHCvZM+z0Lw8NxKvew=
X-Gm-Gg: ATEYQzxW7grIyQUJnr48r5nutQx8G0z+gtnrVCQkwyUVsXocw9RUrKFcb0N3ZeuLZXk
	6sm2pTR9RZmHBUKDlRAbHxoZ/8kgvLC+kLM3QVaWY6C6jTcAa7nv3VdWaQejINCjCINsUdo11bY
	b6mqpBcgUnq/rqCojV7ceKm4wTKfQVN9NJEJjWph1ANP/+SANWDypbxJIT1g3Gf305KJlaK/sNz
	Va0SFNkGfkVQdooMcQP3rBAFfGrAEUN2oUrRc3Mtp/O6M1OzY4SUdJ0V1dhSp23Xhor57LhloqM
	G3CznBFRNjC9FRdfS95xY3ESAkPH0IofZKp0K13K86dMwTCBXrQjDYLRGXW1q+DJ6thAOa8cbsH
	T28qkmtK91WWi/V9K382F3bUv3m4vRGZsqsrfBMCEFCoMtOdr/TwPZ6BbJKFBvtdVDbUqwel627
	yCcFXX10DpDSPoG/a3J13mTLtYaT6H
X-Received: by 2002:ac8:5703:0:b0:509:39b5:a97c with SMTP id d75a77b69052e-50957cd9ef5mr180789421cf.27.1773683218777;
        Mon, 16 Mar 2026 10:46:58 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50939ecead9sm123725711cf.14.2026.03.16.10.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:46:57 -0700 (PDT)
Message-ID: <70049b2767e8b32776438b63c9f11643991bcddf.camel@ndufresne.ca>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2026 - Nice, May 29th
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	libcamera-devel@lists.libcamera.org
Cc: linux-media@vger.kernel.org
Date: Mon, 16 Mar 2026 13:46:57 -0400
In-Reply-To: <20260315221126.GA520505@killaraus.ideasonboard.com>
References: <20260315221126.GA520505@killaraus.ideasonboard.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-bzT7NXbqQInfvVHtfg/0"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55953-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ndufresne-ca.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 1242729E7F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-bzT7NXbqQInfvVHtfg/0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

Le lundi 16 mars 2026 =C3=A0 00:11 +0200, Laurent Pinchart a =C3=A9crit=C2=
=A0:

[...]


> If you would like to attend, please register your interest by replying
> to this e-mail, and indicate if you have any discussion topics you would
> like to include in the schedule. We will draft and circulate an agenda
> after receiving topic proposals. If registrations exceed our capacity,
> priority will be given based on topic submissions.

I'd like to attend again this year. I'll mostly be there to participate in
discussions, but in case of topic shortage, here's two. The first one I can
host, the following one would depend on having a core dev working on the to=
pic:

- Feedback session on the state of the GStreamer support
- Memory allocation and request management **

regards,
Nicolas

** It is well known that there is issue leveraging the full potential of ze=
ro-
copy between GStreamer and libcamera. Last year, this topic was discussed
slightly, and we dived into the area of application control over buffer
allocation and implicit assumption in regard to number of request and how t=
hey
are queued. For me, this area is still very unclear, so if any progress was
made, or is about to be made, I'd like to ear, and application level
participants like me can align.

--=-bzT7NXbqQInfvVHtfg/0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabhCEQAKCRDZQZRRKWBy
9E37AP0d332hSNtFoRlsERs3WJLX+Gt4NFso7G4uqEhpkRwH7QEAqfdjAXQ+ksxF
fO96kSMxKXYrmR4lix0L7dAWGRWHTQw=
=kuLw
-----END PGP SIGNATURE-----

--=-bzT7NXbqQInfvVHtfg/0--

