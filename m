Return-Path: <linux-media+bounces-65727-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zmgIL81/PmooHAkAu9opvQ
	(envelope-from <linux-media+bounces-65727-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 15:34:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE966CD760
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 15:34:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=web.de header.s=s29768273 header.b=gmpKU+0a;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65727-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65727-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=web.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3069300F5F4
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 13:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454123F58DC;
	Fri, 26 Jun 2026 13:33:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B744366DB5;
	Fri, 26 Jun 2026 13:33:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782480835; cv=none; b=Psu5TvjyEy0GDRoOasxo1x/4BdLpCirL+SQr7OUf7Z99LM/VpSEHvXvVziTJ3chgbsyU8+q1g9VcB3DaObvl8E9n1i0GYboenGyRbFWmacdH5bQ3Y6F3ppqJdEq7156W32lSM9q1u5X8eZTvY+ZWFfI6pMDMmWJZDVwE30E/2/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782480835; c=relaxed/simple;
	bh=waumlgt5QqKJVN3YYu8NydotH0rJ3r/MyQ8sHnNFcG0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=MJE3O9jsBkiwBcuzD9zSWGuCMlJfJWBQ4G52PHzqHXrQvQcymXxzoJOen/kqUx3ia1u3togZW6w5XgmON1MQNKjCcA5Ur0h/PsQgGtbTHHmX85KZra5ObFFzx6MeOzzy6XzhNq5WvaT5E9KvEH5lCamEQVXpys93Ind8xF5lSyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=gmpKU+0a; arc=none smtp.client-ip=217.72.192.78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1782480798; x=1783085598; i=markus.elfring@web.de;
	bh=+4eh1PkTo9SqnojCa0mnJc+3Wce32UMKJE5WtGSc80o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gmpKU+0ahEHqK5HVIeyR59Nd41MMO395p1jrwQuDN8FFLi4IAUYsf/ZfSczI0rSq
	 CdBbRdTtcKqIadUndH/MEpcZ38FUgT7mRQDtCtmKA5OoRTpi8qj8PFv+Z4fo0CNVs
	 VZ84Z3hT5iW1rGJUj5NOVqK+4ETT6Y/bjjnUAz7lg1OSdputKPLpVJ0MpBE4tqsDH
	 V6y1V6EpStid3EZprVqYgF8W8erDGU5Tsk+zS/l7p2jfyBkIV4ieBwsW3Etn5a5AH
	 NznxMkWLmKdbFkZk2n9gDXKxP/ss/ogljCP0jDuRbfNeBAQdH4hLPMkLhVHE2xkIh
	 TXwk08omjyoFqW+k1g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MDMvE-1wScId3nIU-008pRC; Fri, 26
 Jun 2026 15:33:17 +0200
Message-ID: <3d94f9a7-6b26-4763-bc54-2e10910bf168@web.de>
Date: Fri, 26 Jun 2026 15:33:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre Courbot <gnurou@gmail.com>,
 Brian Daniels <briandaniels@google.com>, linux-media@vger.kernel.org,
 virtualization@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Courbot <acourbot@google.com>, Albert Esteve <aesteve@redhat.com>,
 Alistair Delva <adelva@google.com>, Changyeon Jo <changyeon@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Gurchetan Singh <gurchetansingh@google.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <20260622204343.1994418-7-briandaniels@google.com>
Subject: Re: [PATCH v4 6/8] media: virtio: Add virtio_media_driver
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260622204343.1994418-7-briandaniels@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:buZX+EgL0FFgsXLBbyUR5VfGptQNtkDqcIS7k8HxglTXFJ8iFyB
 S1CnRTX4796MqMSU5IRtA3zF0JNWBlGBL9bmP/pw1Z+p8wheEtZt/F2Xom9M7AwJbteveu8
 vc8CbuBWPMbGCfTINz2JNBL2Xy3vr/JpSXMeXR0bHtP5WbjULzMrGZkNKYBBHZ43/pMaH3l
 N0Eg9pu1c8CFKnAsD4uBg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:btpTLvdt72g=;o4zt1niBtmFQikHnr58FlAhy++l
 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
 LOEkw3xI5tHWFSIg0hUeDX41lzWdvXBP8b3ViQ9
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:gnurou@gmail.com,m:briandaniels@google.com,m:linux-media@vger.kernel.org,m:virtualization@lists.linux.dev,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,m:acourbot@google.com,m:aesteve@redhat.com,m:adelva@google.com,m:changyeon@google.com,m:daniel.almeida@collabora.com,m:eperezma@redhat.com,m:gurchetansingh@google.com,m:hverkuil@xs4all.nl,m:jasowang@redhat.com,m:mst@redhat.com,m:nicolas.dufresne@collabora.com,m:xuanzhuo@linux.alibaba.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	FREEMAIL_TO(0.00)[gmail.com,google.com,vger.kernel.org,lists.linux.dev,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65727-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[web.de:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,redhat.com,collabora.com,xs4all.nl,linux.alibaba.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AE966CD760

=E2=80=A6
> +++ b/drivers/media/virtio/virtio_media_driver.c
> @@ -0,0 +1,959 @@
=E2=80=A6
> +static void virtio_media_session_free(struct virtio_media *vv,
> +				      struct virtio_media_session *session)
> +{
> +	int i;
> +
> +	mutex_lock(&vv->sessions_lock);
> +	list_del(&session->list);
> +	mutex_unlock(&vv->sessions_lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&vv->sessions_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v7.1.1/source/include/linux/mutex.h#L253

Regards,
Markus

