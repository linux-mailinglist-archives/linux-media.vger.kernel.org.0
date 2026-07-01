Return-Path: <linux-media+bounces-66274-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jY+hFPdMRWo9+QoAu9opvQ
	(envelope-from <linux-media+bounces-66274-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:23:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C38086F051A
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:23:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=luaberry.com header.s=fm3 header.b=DW1VBKz6;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="i lZptKb";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66274-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66274-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23764303830F
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 17:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABF7382F23;
	Wed,  1 Jul 2026 17:22:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7095937DAAC;
	Wed,  1 Jul 2026 17:22:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782926579; cv=none; b=mzLkOhtCe9zezH0E1zVSOg6pllX3Z65Tf5tMxndc2YS6b9fQ5Sz3Th3EDDdI/YsF9jt+MfKsGZ966pE5r5zTn6R2nSNjtBerU6edWOM4osfUKtQHAgc4Ha9uk7B3qrtFDaSreHX7fHOMqQqykKSQV8Hbq9MewCxaZMRWIBwYq1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782926579; c=relaxed/simple;
	bh=X5Y4VVZkiZCIfSDvEHN0PchShZDSL+6Bb5z4AG6HoKM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=K5vUYOGFkee8rZbP0KTknn7DL30UApW5h4RfiUtuPTTaornD0ccqanBMairIhLrIywisuEB6otelKHrJ/hn47h1IZuXCsjBjKnhLBBOyBfWudbEY104LBcokcvH8EtZdxcKvQPAX0nr6abgtw6469i4GiBUqMbsTl7zcS0+3VQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luaberry.com; spf=pass smtp.mailfrom=luaberry.com; dkim=pass (2048-bit key) header.d=luaberry.com header.i=@luaberry.com header.b=DW1VBKz6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ilZptKbZ; arc=none smtp.client-ip=202.12.124.151
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id AF2851D00084;
	Wed,  1 Jul 2026 13:22:55 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-03.internal (MEProxy); Wed, 01 Jul 2026 13:22:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=luaberry.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1782926575;
	 x=1783012975; bh=X5Y4VVZkiZCIfSDvEHN0PchShZDSL+6Bb5z4AG6HoKM=; b=
	DW1VBKz63qREbXwLl6jexaeKn7uirxFSqOlOdhyxkgwxw+VcyXJ4KhxmBPowVxsT
	mDZUsiU5gH6OleUOZMndec+L7ITNWJqSJdjZ/tfZSPEwa5H9JCIuaiVO+b2b/dli
	OEK2glkDf9qZ2vmtSHNrna2zvLdIFxGLO2ORq9EKOCPloF0b0SEWp/vLoWrDiL5r
	O/emLzfoHZgaqjWt4UDaqBTz3P4MUDApp+qNsRPk3GxzQqzUr5vP2vGbUDISchaQ
	gOQzkqMoBW82Y7LEH2Xkqsk+Z9nuopgaW0GnajYmIinhFAsDDXBS90fOoZxEcn7M
	wYuzaMye7VHItvRxEbwvXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782926575; x=
	1783012975; bh=X5Y4VVZkiZCIfSDvEHN0PchShZDSL+6Bb5z4AG6HoKM=; b=i
	lZptKbZeLEz3loXr3LCk5pQsAdRekcgqx2qBuVAQ6qB07JZi2643NQkKgRKjhos5
	l5n12QmXoQeL6M6m/cIIOHfzO1li5T2QzWYJyaGGHGraNnXtU1D/m0siGGy5cPxf
	QGqiPRjVbFD9S/TxfpqvTtedHqaFBcKuhMiBAhl3SU8g5p4ddwpdOrJKcUJBa8Ul
	tuWbFW4iGRlc5gCX811xNJ8u0OQ9t/u8sXNFJduDw6UpQyPFbVjJoM1EkPTAA/Dt
	y+huhqGJjWKWcaI6lpU8VeWowpt9F6HxOxKdLXcxzUUsmbmjydZv9mO9AnHvPxWX
	DCIdnm9POHUbjCatJf1lA==
X-ME-Sender: <xms:70xFagnVSdos9hchodEmFBFJdRubfVMyIPanIMi_Kae2bNTx1BIUhw>
    <xme:70xFaqqesFQSYrB-0B8n8TZzxBEsP-OgKb40vazRO4umo4R8faJ-NxfqXbqkVkmaq
    yH7GBsZtFreVsj43sV_S6QoifEbKocMrbaYQN_6K6MzRBz8A0MTS4k>
X-ME-Proxy-Cause: dmFkZTFW56SnLu5hUMemt9inLXuRi8LOE6B2T2byLslo0Z/0s4XkQO4GVRG914f+LOtBWw
    jUEAoDiBNJB5Mc5jDU8mrx2MWbtIyX44ACumKQz08jLK6qV+t4Asf1hvNuuP3j4ih/7IBh
    F3cJN0pdUpmyk9i6Wwg2PdzMg6WCpI84NELVeKYbBu+KFH//Gy0Pw+WNe0btrUkbQ8vpIC
    fPLO8Izo57kNY65hkW9pnEiIEJ27FKx+pImZAgyHJl2HW4VYLFLl3z19x9y5R70C8ltzVb
    upe/aUzzJ4yW5318PLgKEAMtuV1n1LbjHZE/RQEYYqU9g1APLzoxscJt196qDGjhAY1utV
    TYzVdS8749uhDK1Ei8DSVE+qgvfIxr+ymKPReuCjkn45fdLhC2Xo5TAwJqKXOaZL7i87No
    fer6PjpVRsc+dqz9SogCDzdDAsYe6D3pOGKFTOcfP6EX0xIiddDr0UfWGspzAzBGXbXdae
    SfOqy9pY4QDuTbicTK95wKqk262cdKyeMvZF/idOFsS9G1805bqMQVFi4coXr2JrwlHioh
    OIlr2zbgNX4n/DADykZMmfoj6DdR9URpGKiL01LhNqP6dKVlsxUiiFupElBILBAYQ1S1vr
    RbUVQLcs2ocOCqhYc/zx1B+FikqQj3XdfqOsQFDOFmXDwxY+pD6nbvEt0LDQ
X-ME-Proxy: <xmx:70xFahTMuSXSdL-jkBxwiAkCQL5kMBfz-mxskJYZ407yxchiXtW2Cw>
    <xmx:70xFapBiXtoxaRNM6-N9fLgbgP4dM0QkRruXrNiiNMHS4ljV99sT8w>
    <xmx:70xFagKby3o2MFUx2An3HICzYknWpwswKPQYRdDhj5ygFUD_Afo1UQ>
    <xmx:70xFasCesc5pitFmsdqfwj3duRRsOuy_t1CZD-IuY-yWXbcOQyTENA>
    <xmx:70xFajMMyChWspveBq68hBEMWJ7n-0uZJ2Xx97dBRWJc6EVEhZlAXNvN>
Feedback-ID: i372e487a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0D484C40072; Wed,  1 Jul 2026 13:22:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A74LFP6wUQ7F
Date: Thu, 02 Jul 2026 02:22:32 +0900
From: "Jeongin Yeo" <jeongin.yeo@luaberry.com>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org,
 "Greg KH" <gregkh@linuxfoundation.org>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>, andy@kernel.org,
 matt@mattwardle.net, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Message-Id: <69b5aa9d-03ba-4082-9350-0f803edb4d06@app.fastmail.com>
In-Reply-To: 
 <CAHp75VcL4KK=K4ZhT+Qc8VWUBsdaPcjcHJX0WJu8cty_fpJsOg@mail.gmail.com>
References: <20260527073705.1544479-1-jeongin.yeo@luaberry.com>
 <CAHp75VcL4KK=K4ZhT+Qc8VWUBsdaPcjcHJX0WJu8cty_fpJsOg@mail.gmail.com>
Subject: Re: [PATCH v3] media: atomisp: remove redundant prefix from dev_dbg calls
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.15 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[luaberry.com:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jeongin.yeo@luaberry.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andy.shevchenko@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:matt@mattwardle.net,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:andyshevchenko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_NA(0.00)[luaberry.com];
	TAGGED_FROM(0.00)[bounces-66274-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeongin.yeo@luaberry.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[luaberry.com:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C38086F051A

On Wed, May 27, 2026, at 5:05 PM, Andy Shevchenko wrote:
> On Wed, May 27, 2026 at 9:37=E2=80=AFAM Jeongin Yeo <jeongin.yeo@luabe=
rry.com> wrote:
> >
> > Remove the hardcoded function name and line number prefix from
> > dev_dbg() output strings within ia_css_binary_find(). dev_dbg()
> > can already emit the function name and line number via dynamic_debug=
's
> > 'f' and 'l' flags, so embedding it in the format string is redundant.
> >
> > This resolves the EMBEDDED_FUNCTION_NAME checkpatch warnings without
> > introducing __func__ to format strings.
> >
> > No functional changes.
>=20
> LGTM,
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
>=20

Hi,

Gentle second ping on this patch.

It already has Andy's Reviewed-by; is this patch ready to be picked up, =
or
is there anything else I should address?

Best regards,
Jeongin Yeo

