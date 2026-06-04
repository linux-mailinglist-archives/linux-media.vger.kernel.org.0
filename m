Return-Path: <linux-media+bounces-63834-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lywGEDvKIWprNgEAu9opvQ
	(envelope-from <linux-media+bounces-63834-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 20:55:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E88642BE0
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 20:55:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=di5snAZX;
	dkim=pass header.d=redhat.com header.s=google header.b=Rd+3+vqV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63834-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63834-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF1543045CA7
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 18:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0938B3A5E6C;
	Thu,  4 Jun 2026 18:53:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E95B3B637C
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 18:53:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780599230; cv=none; b=ujE3/4rfwQaQL7NtLf8Gw/eT6OsmB33nsLPF8JvwlvPxSVm641gAYIwIBUvBREedBpj6QRSh7oI+G8e+uoq4Fgp4LG0LnMhNX8r0TuUo3LD1c2eabPenqK7TM/Qv2ppCQJjNX+xOP7KXmNq+qI2BMudV/FvYD9L1c0RmTgWNdAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780599230; c=relaxed/simple;
	bh=XsZqKqQ5apgHHhOX9Ab/NdIUELyx46yV4YngdL7eMI8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pXUo3nFg+hwp8+dka3Y4d4w/G+9Y1Sc8oEN1fM7W7G2ImMJ79gVcx66a1sT2M+te77d/PQOm4m+nGiBF9zuot2olQR5joljUezkHnZiVFXiUvdmg7gSQ3R6rtSKrgSqc91KK7p07YcI7usnLQpYz/7cTfGhdvCJBV8suoAPC0QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=di5snAZX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rd+3+vqV; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780599228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XsZqKqQ5apgHHhOX9Ab/NdIUELyx46yV4YngdL7eMI8=;
	b=di5snAZXO+kcuk234ZjHKvIhiVCRlRdCX4HndkXoqWHPRIgeBvz+XqmfQ9QU/eZW4Fsems
	bH77WFvsjnn+p6at1G+ojqkPGrNflA3XlUNQ7zY/kSbcESSOjrnQ/jBnv8j9KI9BfSwMQH
	5qb5WwoSzGmYNGgoXgSs3ZL887p5d10=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-BBEXJodxOiiAySP1fV78jQ-1; Thu, 04 Jun 2026 14:53:47 -0400
X-MC-Unique: BBEXJodxOiiAySP1fV78jQ-1
X-Mimecast-MFC-AGG-ID: BBEXJodxOiiAySP1fV78jQ_1780599227
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914c8954923so248617485a.1
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 11:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780599227; x=1781204027; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XsZqKqQ5apgHHhOX9Ab/NdIUELyx46yV4YngdL7eMI8=;
        b=Rd+3+vqV5MX6LORT7vjofDFIZj9LrIxC2/Tf4VIpYOyidIwSQiGub4hhBGeI/qi65C
         p5moG3bSekp6bryyIN657kmnEPot0nRASYj61AyHUs2NbBGtNbv7WrX3N8RhziBR6I+e
         QthAW/s13W+cPPK5oiNvUCFA09Sh639tntn6qh5IhSBd2oOR9mFEkL1XJ4Aq39Co3ZV0
         tKw2v8WYUUpKVUPVQvmLis6AFTKHGcrIHn+Oypg3//aDT9L2b91I+glGcT/vyNRr0jLf
         mz64HzludgBm443w9VUOHRlGbWpG1Yh2lLJhBFo9xzVSUa4Qq8XSJhGY4GxSNHrDCFtJ
         jPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780599227; x=1781204027;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XsZqKqQ5apgHHhOX9Ab/NdIUELyx46yV4YngdL7eMI8=;
        b=gfwjcN8mHXPsi/x/7OqR+wVTzsZImYsyH/JAxT6xTR11z1+yIdylLB252IvfEez9C/
         K/9p8SCdGDjoq1y88cqP//+abmHKVOnN9sIHGBDqWh4ZNIO1tCGzlmQBvkiHB04Ny8Yv
         Y0Yox2hzRi/KeHH3CYZRwAbiIugR5mDz6OtJjjL/w3eNBVUSvzvNYd7y93wBir9zolb9
         92v2fQ3LOr0Slai21tacunJMxBeT6euAaR1zjSYc+kutBTqu1LXKMDbCWcqbID8kxGZd
         IH4dMbfBai4jaLKvWvQlXkjrJhI+Uyn9iEBG4TgdK3NxZtpDirAq7ozspPe7YrCuCwYB
         HPUg==
X-Forwarded-Encrypted: i=1; AFNElJ96lq6bWp7ITh52+bEKN48YSK4NXHJyXBI4op9shehn981LkGk4TeTAon1E9mj3LF7XfXYSYo2nLKq7ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiHQAVbsuYjTLgGn7p80ZUdPM7fWz1spfCn+2MwxReF4Z6UEeW
	g8b8mpzJBl16XM+0fqouPZIOpeXRmmtdk10qX/Eru2Q2BrSbuv2IEP1gdUUAng/gvwSqKy0dbRr
	T8NsyrReP8CxXv7eEGLWfwfeRGRBea5M7772hqhhFX5iql49Ug8qqnIjn4zMCsWmV
X-Gm-Gg: Acq92OEnHZ9dT7YUaWpguWgnP9ZHpClgcHm3N38FnawX+kH2EQcPr0i8JngFXJIUB3M
	lqSFDCj9kDDEY7ycTTSNzjGDHJy7QV5MoGk+/Y8AaofeNrTwFnbl6wlevc6z64E6cwEed1BXAok
	/nCcV7A1RykB7xLL0kbZUcKfoabbFbXoNFOUAUiVdf2uys0tr6ahCOM+IHxzHqQ7rfO4zFURHtL
	ftGehCTDNEc1COrkOu8NdZLY6WavYMyPdD5ElfvXp+jCtnJhlDgtjhwV7DXy4f12hbZnQxbLnCk
	uogzJoFezGrIYsLYerpr35suXVC/48bZsnFkhm2XGH5bRGkBFjf5z9i5een5TYOdSy0JCqaQfIV
	wxgDtaHKWeapYOgzez4ij4r5DJwDa
X-Received: by 2002:a05:620a:40d1:b0:915:a51d:5ee7 with SMTP id af79cd13be357-915a9c496b2mr73287985a.8.1780599226722;
        Thu, 04 Jun 2026 11:53:46 -0700 (PDT)
X-Received: by 2002:a05:620a:40d1:b0:915:a51d:5ee7 with SMTP id af79cd13be357-915a9c496b2mr73280485a.8.1780599226214;
        Thu, 04 Jun 2026 11:53:46 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a237330sm683172485a.16.2026.06.04.11.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 11:53:45 -0700 (PDT)
Message-ID: <dacbea5b8b7c289cd467774c40f3d888a1f1214a.camel@redhat.com>
Subject: Re: [PATCH v17 5/6] rust: sync: Add SetOnce::reset()
From: lyude@redhat.com
To: Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo	 <gary@garyguo.net>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, driver-core@lists.linux.dev, Miguel Ojeda	
 <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, Sumit Semwal
 <sumit.semwal@linaro.org>, 	linux-media@vger.kernel.org, "Rafael J .
 Wysocki" <rafael@kernel.org>, Maxime Ripard <mripard@kernel.org>, Benno
 Lossin <lossin@kernel.org>, linaro-mm-sig@lists.linaro.org,  Danilo
 Krummrich	 <dakr@kernel.org>, Mukesh Kumar Chaurasiya
 <mkchauras@gmail.com>, Asahi Lina	 <lina+kernel@asahilina.net>, Daniel
 Almeida <daniel.almeida@collabora.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Thu, 04 Jun 2026 14:53:44 -0400
In-Reply-To: <aiFoUauWYLz-Oyrx@google.com>
References: <20260603195210.693856-1-lyude@redhat.com>
	 <20260603195210.693856-6-lyude@redhat.com> <aiFoUauWYLz-Oyrx@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63834-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[lyude@redhat.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,nvidia.com,garyguo.net,amd.com,lists.linux.dev,kernel.org,linux.intel.com,ffwll.ch,linaro.org,lists.linaro.org,gmail.com,asahilina.net,collabora.com,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:dri-devel@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:acourbot@nvidia.com,m:gary@garyguo.net,m:christian.koenig@amd.com,m:driver-core@lists.linux.dev,m:ojeda@kernel.org,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:sumit.semwal@linaro.org,m:linux-media@vger.kernel.org,m:rafael@kernel.org,m:mripard@kernel.org,m:lossin@kernel.org,m:linaro-mm-sig@lists.linaro.org,m:dakr@kernel.org,m:mkchauras@gmail.com,m:lina+kernel@asahilina.net,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:lina@asahilina.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,linux-media@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8E88642BE0

On Thu, 2026-06-04 at 11:58 +0000, Alice Ryhl wrote:
> On Wed, Jun 03, 2026 at 03:42:34PM -0400, Lyude Paul wrote:
> > This function simply drops the contents of the SetOnce, given a
> > mutable
> > reference - since that proves we have exclusive access to the
> > SetOnce.
> > Additionally, update the invariants for SetOnce to make it clear as
> > to why
> > this is safe.
> >=20
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> This isn't needed, you can just do:
>=20
> unsafe { (*this).sgt_res =3D SetOnce::new() };

I realized after sending this I could also just be using ManuallyDrop
here instead of adding a reset function, which might be a bit clearer
anyhow


