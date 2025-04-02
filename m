Return-Path: <linux-media+bounces-29231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7A3A78EC3
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 14:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BA6D16F3BB
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 12:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2ED238D22;
	Wed,  2 Apr 2025 12:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="bzux8zjW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E311F92E
	for <linux-media@vger.kernel.org>; Wed,  2 Apr 2025 12:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743597621; cv=none; b=pgDNu7kclDYQPb36I+nxmTV8cZ3u+ppa1/FfvIkdKPiZB/wBuTQLkQ/r42/Rw8jTOardHv36Ge822CQQgn5FwDC6G5RRB6fZI/P69oke3dc3nnZKvU+6EhQCRSifmHyWgKlLWfDCyol6bameYdU8uxvYc1B80DBrQbicZ0jxS8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743597621; c=relaxed/simple;
	bh=wIDCKaav4rjq7GO81UrO1U0V+34cnQ60Riwt+QryWB0=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=phRdaBNrRO/dPuJg/ESLgSZVDulrkmpkPGtwyr5/Y75cX8kNfZrhqhKBKDiubksMsPu4a3Q554qVpJEFzITvTWyp36DVwy+x1ldA66+VpDsu0KV5qOhPjaCZzII1kueQvYJ7TQ6o5piES7VEN2uEHEt0NFGDIJAfwv7H8N1/GKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=bzux8zjW; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c58974ed57so693630585a.2
        for <linux-media@vger.kernel.org>; Wed, 02 Apr 2025 05:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1743597618; x=1744202418; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=anWpglhHhZa4C1mEOhioxHPPOfoih4GDFIsj+uvuCDc=;
        b=bzux8zjWOFXOEord2Wol7zcBgWL62PEkfIvH0Wan02liR/iDASjEPokwl+dgW5qUa5
         xAUxZMH/d/bNjC5sXIIoJuZoPD8w7FnucBIvqVJ7gbaWyfjesxQi9DF/MOzx9iBYMMk3
         oQqwkZpuykehaDhUBeHp0gQLxOhEdTjcBhyYmS+CjzR7Wgjwm+SyjrWmLeXi1Mvpk3wD
         LfKDYcKQuNdCrfrc1Ll9pYPG5BzGt/HsnOPx5klZyyAVBLBsWYn63AbE0StVsCEOdJgp
         eX53FsgWMBRzfXOY8FelA3Xpf5eduef6yn36xnD8veyhLPQFLf1dDgUDBzj5BVMxV18r
         mVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743597618; x=1744202418;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt:date:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anWpglhHhZa4C1mEOhioxHPPOfoih4GDFIsj+uvuCDc=;
        b=CVQ6i7Uv6f+8NHAv2AlVOnCsenVng0viUJVbJarIt/TzUO1Q1tARgtYH7t2xoQw6K5
         hcIxqjuslg2AnkolaaTG+GJ9U9608VELo5FZd7wDEIc4s6NpZG1LTp3I0sOAtuu6f1wt
         BK92kHunibT5wpygXZMdjGcPKJlvvWUeHHOVbPSbiZQ6BofDrVR6rhImZyL34fMQR+d8
         UWF8aPC9RNUyqHpV2BGAPFP/HaCAhkUTbBLHYOIa5IoNnwEM2fWfmV5MwxVe1EtreK5I
         XeZ69uxFttWDe0+wIXcBXllrCmIMzvg9xfa3zYEWLjYVAkXSUUj35LHIYE/gGOi/fRfc
         m5ig==
X-Gm-Message-State: AOJu0Yz82kK0bHNzV9Yqxd3r8ypqDu/WvRF0hv5VIIyG3oqjchWZjG09
	sAp/yEMNxs2GSH4WpgbskdzcI3S5tRyrdpq0g6WJRJy2AE13I8lf12OvlrZLdIxByW3uVixC0B+
	L
X-Gm-Gg: ASbGnctgiellhFB9gG4CeC8OszRI2DZ7dfbb7trp+GA1QV+jkSAc1EJE91ixSF3sUnl
	4wpve3RsMRIA66riGYI7d5QAFFiCk2fEXoKgRRcaKW7eCau2oRD86bQJblehtnfzUKWm45QJSyB
	id86dlCysTNQjY+nGvaBqXoQwSUzNOrOLp9p5IkLbNecl1p/XeoO46C93OGl+wzOpL0lnUwpybr
	DDN6pwPdQfm89Bd8xUrZipDBaSi4XXG6sYzFD0uwOv7tpbbBqEDAzTcX8pIjiwsB694E00T151D
	S2a7cwlC3oqF31u7snRA4x+mncZEu3oPT6SUYKeKLsvCPVuHVg==
X-Google-Smtp-Source: AGHT+IHY/s21mliR2FhxThB+xQn5T3D8QKKoiV4NLhCEnUeHf7L31gpDqo2vtKqRSFWILtFk8HUVCA==
X-Received: by 2002:a05:620a:2809:b0:7c5:3d60:7f8d with SMTP id af79cd13be357-7c75bba9fa4mr834089385a.19.1743597618589;
        Wed, 02 Apr 2025 05:40:18 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f777dc72sm782402985a.93.2025.04.02.05.40.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:40:18 -0700 (PDT)
Message-ID: <bd26cb35ab209a4f522fea5a0f69c40711a8fab8.camel@ndufresne.ca>
Subject: [GIT PULL FOR 6.16] Fix minor typos in codec drivers
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: linux-media@vger.kernel.org
Date: Wed, 02 Apr 2025 08:40:17 -0400
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Hans & Mauro,

The following changes since commit f2151613e040973c868d28c8b00885dfab69eb75=
:

  media: pci: mgb4: include linux/errno.h (2025-03-07 12:05:42 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-6=
.16-media-typo-fixes

for you to fetch changes up to 468307622140ebb2702bc58681bacf79dba27d18:

  media: mediatek: vcodec: Remove trailing space after \n newline (2025-04-=
01 17:10:28 -0400)

----------------------------------------------------------------
Minor typo fixes

----------------------------------------------------------------
Colin Ian King (2):
      media: amphion: Fix spelling mistake "dismatch" -> "mismatch"
      media: mediatek: vcodec: Remove trailing space after \n newline

 drivers/media/platform/amphion/vdec.c                              | 2 +-
 drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

