Return-Path: <linux-media+bounces-62133-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AL7CElWDGqUfgUAu9opvQ
	(envelope-from <linux-media+bounces-62133-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:23:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE8E57E9A7
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 885F230BD82E
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 12:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D1823E324;
	Tue, 19 May 2026 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="FUkKNPvA"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907744D2EF2;
	Tue, 19 May 2026 12:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779192934; cv=none; b=q/qBt2SY+Mk6UZiGDjuVtEPhACh18JfqlJJlwmPQh0AA1iOnDLjLAUZYjZUh2FNPwOjnUWbTZ1hSVy2w7qNWteE4JNl6FJ7owvODoP/Gv8JvVDA/OuJ/wEPwTwH3KdYhizSRA52T0kC/+lcP/r/Yth9/046HZPZY89tXgkulBo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779192934; c=relaxed/simple;
	bh=CXx/u3vKSJnWVOiDDZPhI2ckjfwxBaTk6Gv3lKidhY0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=JTnHVYEN5J+1UwA6p4zviLBojXuW/QSNzmYDs/NItDDpDsL6iu2BkXqbAHDGVofF+gw8sPGqvyJPhZc6ikzCmi61Pvy5TGzZzaON6zAP7WdjN90Gm4U5G1fEh5NTr5pwUsJqj1CcNsSUM6QEhjo+rATMR1B6UkeFIgvuz9LSxCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=FUkKNPvA; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1779192886; x=1779797686; i=markus.elfring@web.de;
	bh=TJVCrmpS/0Yu8FOvt1EMzOtMTmBXYYMBLETUzrErVFw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FUkKNPvAnbwFc8wBE1oYYqlr3z897iUirAo7YjaAtN8nz2/hkpl6a9tnTp4af0Yu
	 3dwy5Binv5WthqO16E7e51/aEg1zSlsU4Dw7ERJHxOjPKPZ5F4FOs9UUphvXNzup2
	 vqOaKuOy3b4TJUNQgzadajswVXzuC4ezBEI7jFijMVBZRfyLMuLEHDhufdLrK6rOY
	 Am6//xF2cx82iJvdx8wSA9Ms9KBfOzLP+eKB5goRgP1+XJaUkK1Ve0a+6qet9qQ3d
	 pSh1vzvCNUqlwZG8xrivRboFyqTzgQsZ7Fey/btoDtoOt8p8xR92pIZ4uZigjwxJ/
	 VxmLi+dW+do9g7hfDg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MPaMQ-1wlmAm3MCg-00RF4c; Tue, 19
 May 2026 14:14:46 +0200
Message-ID: <5e0d72fa-929a-4905-9066-6648892bef4a@web.de>
Date: Tue, 19 May 2026 14:14:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>,
 =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Will Deacon <will@kernel.org>
References: <20260519-qda-series-v1-9-b2d984c297f8@oss.qualcomm.com>
Subject: Re: [PATCH 09/15] accel/qda: Add DMA-backed GEM objects and memory
 manager integration
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260519-qda-series-v1-9-b2d984c297f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bRsIFpvwYiV1tO+OIATn8QYrABXSKCixA8cn8eN58JZxMSBs7wm
 Scnwmh4u29DLaKlpE3M2zIzB7s04okUO0pdJKSpBOp1VG870ii+pWVStg9i9JES8W5a5v6k
 SMRdE3zw2m1nLAaLNP17bD9Q1p4Z1+ID/USnLfBqChpHul92p2PN2ntTq6s3A6cpWBI1VlL
 XXD8bYrG6xbZjpM5Wqkgw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bQNescsDjyI=;IsRfxZgLSPDLEqdpF+zDe/1mMIu
 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
 2xwz4YiawcJRtkMOEW2Yp9mwtGo=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,lists.freedesktop.org,lists.linux.dev,vger.kernel.org,lists.linaro.org,amd.com,gmail.com,8bytes.org,lwn.net,linux.intel.com,kernel.org,arm.com,linuxfoundation.org,ffwll.ch,linaro.org,suse.de];
	FREEMAIL_FROM(0.00)[web.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-62133-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9EE8E57E9A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=E2=80=A6
> Assisted-by: Claude:claude-4-6-sonnet
=E2=80=A6

Did such an information source gather the knowledge to benefit more
from the application of scope-based resource management?


=E2=80=A6
> +++ b/drivers/accel/qda/qda_drv.c
=E2=80=A6
> @@ -32,6 +33,18 @@ static void qda_postclose(struct drm_device *dev, str=
uct drm_file *file)
>  {
=E2=80=A6
> +		if (refcount_dec_and_test(&iommu_dev->refcount)) {
> +			spin_lock_irqsave(&iommu_dev->lock, flags);
> +			iommu_dev->assigned_pid =3D 0;
> +			iommu_dev->assigned_file_priv =3D NULL;
> +			spin_unlock_irqrestore(&iommu_dev->lock, flags);
> +		}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&iommu_dev->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v7.1-rc4/source/include/linux/spinlock.h#=
L619-L622

Regards,
Markus

