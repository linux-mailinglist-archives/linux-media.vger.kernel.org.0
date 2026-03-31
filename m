Return-Path: <linux-media+bounces-57706-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHIHMxdVy2moGQYAu9opvQ
	(envelope-from <linux-media+bounces-57706-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:01:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F95363F71
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DF1C30416E1
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 05:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E98367F2E;
	Tue, 31 Mar 2026 05:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctI9LBZk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3613236655C
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 05:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774933216; cv=pass; b=uNb0EBLOkXssH+7NO9kaOndbNIqtrUya6G2M3npmS/qjQ03JF7lJ+sB5rWl4c71g0KDLtDF2lTSuK77chxWIPS+e5qFYVetIQmRCMmnZcTtEsDLHrtjHLPiKlt2OLfs1Hy6gUgG7etLqB+5CrW+jkSvX2NcbwxJBMcPerFoosOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774933216; c=relaxed/simple;
	bh=qn9GR33IpU25pLfXu1OSUX8rRbknNQbsON2unRJuEZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P3eKzpU6wr99k6mIL8GBRtymcgoQsOa7zmWchMAE8CO0wn0uIUsXcKvW4ageHVzDlSPxxmuPasHbXqgUguQMqxWufLq4hUDU4KyrgeiZ0Yy0JXHS3ID3uTOyje7KQUI4E8DKC+CWL6+riyqGDy0G4IrBH6MqjBjtVKbV4+44Udc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctI9LBZk; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d4c383f2fcso5030635a34.0
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 22:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774933213; cv=none;
        d=google.com; s=arc-20240605;
        b=RtnNS3flXh35LphamOb+KLYkZNIUZHwvVftCv8kFxHnHlDd3XG9vDtuY30GkFTJGm0
         KJw6ioJZ3/4k3EpXfdgAqhsqo7r3kgc/J+e4kTVtzp8rwvo2+BYasrEB3vWYTShh8HBu
         WZB8w2Xs26D/Hhr3rqqkHTSfqmce5JwKR9A/OVqbvp4edQgvbeQtpNVAbzQ+oKyBVkSw
         vHbQe5JDsD3PMVy868jA2MHNMbW5J8nUXEF2Tq2RipqEG8MbATtSapsQhguhIyUvET4h
         F8RbMPBW8HtzoAmg/RK6i+/UmXZEs86HNxxdjrl8lUfs4LbHedd885XMy13CjjAP4+JC
         NlHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qn9GR33IpU25pLfXu1OSUX8rRbknNQbsON2unRJuEZI=;
        fh=/m22ZVgd92MJ5Ydi6DdqrlUfpqggpk0PB+XHl0JFjOk=;
        b=Onc2G4l1g6wE+OWur1ZP2U0XbkbHK36vcujmQl3oveFkXF1r11VbkLxyOFAVcWRUph
         7eZVMUhfVU87MbBu7WRKgFwBC3Rl59dvnCAFiu7x9RHLqDESrOe9O293oiyspAm7Hyht
         idqze7UnbcJXHfmcut6p253kzc46RTjDAvFAa6WFA/1qYoshjFthnXC5SJuijOAm0ZbC
         ohMDFwsPkjGaQEhhxPiZ+n8ZaUhpluJ3ojdgLl3X7Qghrw8QLUQCzLHQKkuZOKiJCcuu
         wor0VxErY+vd4dMbm12WfAkGWlhE6ruhVy+UjSp71RE6+fyZWx5u0+1qzT+EPvLZsDxe
         pjDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774933213; x=1775538013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qn9GR33IpU25pLfXu1OSUX8rRbknNQbsON2unRJuEZI=;
        b=ctI9LBZk4mCo+jRYC50HmwAamhxPDbLy6u82T3RWj4BgwkUAMDspaFRUKYM9YBO6mG
         DIB9+ijV6JFgisU9q1O+PrzDYCdgXIlui9tBONhOgKLqs0njwG2XKGUGIUU9Q/6whIKZ
         W3i67VEplsqpqbKc0k3Rt2NwlOVzG5OoPmpARnKnuEZ2J3apMdh2S1DxMIwhN0ho93OY
         XBmsiFiohVFon8mIb+xMRhhd/f9+Pv7NSdADLHaLlitU+LChwqiKt6ahgICSo3QSjZwT
         LoxjrsucSB7MJHhIpkduruN8CJRDEfMViou5Xp2QtABRA7p0O/+zqVwJCtkaETwZZaP+
         8kJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774933213; x=1775538013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qn9GR33IpU25pLfXu1OSUX8rRbknNQbsON2unRJuEZI=;
        b=HxSjrH6F/OOe9UjIeDhYCMwDJCxyOytHMv6rIs1tcEFVQNdv4nBbQGBIcXpWuUl+8D
         X27f+x/IyCuq3rGza0iEKGlCqiOfbha71ex5jFKUAMxFmMv+VJNTUGFm467pxJc51qrA
         TC8KE4ltEG1EhY4423swGf7Xbdh8f25Mnz55IJqJlGmPsck1AEfmSg9mekFyyyfDj5x5
         xx4KjN429G7tmBlNGhdtVztP7M1EjvlEgiGdH8iq7xeY5OPPeddEPwX2PgW5O+BbDlZH
         VkmDC0dPRuwKAWl29DHoyhpzXj5vjlSP+Ipb8HPwHYHcY+9aAzO1e1D51jgbQRswCdqY
         1Y7w==
X-Forwarded-Encrypted: i=1; AJvYcCXiE6AMferUV5svYJ5CFYE5DP9P46UeIhA2l7nsZBguypNZKLJRYqUot4Gy0qNFtRuidS6maAEA70sETw==@vger.kernel.org
X-Gm-Message-State: AOJu0YydDUaDM8PJUPTD7g2QoRQiW/gxa2O6W/9L2P7bIN2uAttpXG/O
	JSJ1Y5PfMBrRSPycBpWjV/HDNaBmDxtrs3sBxWdeyJzQQvq0eeGk95G7U1ah5tvUliNtOq83JbL
	7+1HmIqHGkVh2njYHDh/MDmThjJNZMSI=
X-Gm-Gg: ATEYQzxYaZKvizFXKVwr3ExhaZhHwlRMt/DFV5hce8TMGPdy2swaJT3cIFVOTCDe0F1
	SbJ4PkHREBNKh2W4r821KQ9pTg0R57kX0/8CMNaOSE8cs7384/td4diUVXv4Tr+tKADLeL5CsXd
	4npNUlewbo8Yn5tH6Sw0CnbJxXwRuwp7BEWtgf2tfBK9awwRQdokopO0MC+obVqCidnBRNwTJ54
	dOXHlkvMnAV/Gmy7V57oyc1FJL1nGIhJl5WXMpAO8b4riY8a+tnHcrsbT8X5QEUR+rLayraCQP9
	ybEqMnaVkxzf843Vvyzr
X-Received: by 2002:a05:6830:82a9:b0:7d7:455d:1003 with SMTP id
 46e09a7af769-7d9fad9b3d5mr8646097a34.4.1774933213062; Mon, 30 Mar 2026
 22:00:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314232722.15555-1-mikhail.v.gavrilov@gmail.com> <CH3PR11MB7177D5538C726029D80BA6CEF841A@CH3PR11MB7177.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB7177D5538C726029D80BA6CEF841A@CH3PR11MB7177.namprd11.prod.outlook.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 31 Mar 2026 10:00:01 +0500
X-Gm-Features: AQROBzCwLvCBjKMjXnGlDUOQAPoq0K7FN6AFDT1twLET-_2xPEv2urT74LC2vBE
Message-ID: <CABXGCsP+4pSyXHcOBokD5kSuVVa86xhjD+8OTy2woGavovhNKQ@mail.gmail.com>
Subject: Re: [PATCH] udmabuf: fix DMA direction mismatch in release_udmabuf()
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: "kraxel@redhat.com" <kraxel@redhat.com>, "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	"christian.koenig@amd.com" <christian.koenig@amd.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-57706-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Queue-Id: 47F95363F71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 10:42=E2=80=AFAM Kasireddy, Vivek
<vivek.kasireddy@intel.com> wrote:
>
> Reviewed-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>
> Thanks,
> Vivek
>

Hi Gerd,

Gentle ping on this patch. It has Vivek's Reviewed-by and fixes a
DMA-API warning present since v5.5.

--=20
Best Regards,
Mike Gavrilov.

