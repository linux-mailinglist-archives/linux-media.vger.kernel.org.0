Return-Path: <linux-media+bounces-63477-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y0PmBMi1H2qbowAAu9opvQ
	(envelope-from <linux-media+bounces-63477-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 07:04:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72321634353
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 07:04:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=squebb.ca header.s=fm2 header.b=19vLfeu6;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="Q dOGvx/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63477-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63477-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=squebb.ca;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74C33304CE98
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 05:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186A836AB56;
	Wed,  3 Jun 2026 05:03:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEC01A8F84;
	Wed,  3 Jun 2026 05:03:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780463011; cv=none; b=Lik6e5qcYf9QnRLn1O43GdP1wDYh6fQtmvp8y/8i5HWVcfk1Ni85Xq5uG3v/Gvy/92W0xSdgNpxekZi2WfaNT0yxXemAZqc7UGf3hz02GGDseLUV/o1I4Fbp4tjXRSfB5cgj2RIfJ0gelzAPPoGmD3EdNo+Me2HqsY5nh0fiQnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780463011; c=relaxed/simple;
	bh=AnWx2sc2ikIB9Kzg2RpGXndBMtRPgDAKEYfA0zD22aA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=rFGrqQ8jInvTvXd/Cvdw5bDuiM3cpjlGcysD4W/u2hG8CfsiaBiQ+tJVfPmgrVsVIhteJmhk/ss7bYsVSgvq8N/kbagodDvtxPBc1wDjbQMw+ScatV1xHoYAfVzNUiYVtHbs9J0uNoRSkF6Wg3QdaYYxRgHD+EZE3uL2LhjA21g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=19vLfeu6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QdOGvx/G; arc=none smtp.client-ip=103.168.172.151
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 6AD5BEC008A;
	Wed,  3 Jun 2026 01:03:28 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Wed, 03 Jun 2026 01:03:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780463008;
	 x=1780549408; bh=ws8WYd0GmictUe6BKqpSaYsPsRCChPwQW2zOOHmZTtI=; b=
	19vLfeu6xgCnIxtihp2Ong7VfvlQeUc2UTBOsbjSVrEZHFjqNZXvwXQ2XacPM/o1
	p/EJzMqwxVzpz9zq+QED6XpaGiLMbf0hSdO0YDBT7Gk42rnH9gIeoNOsaQcDvnk8
	7W3oB1qg7PgzdcG66csk0WNPXTGUlzEvLK+oXa2n2aFecbUthJR/eAkowhOyxwdz
	LbdW+YWM7d5B6Sa4QqFGdSoq/gG+hDgU5J3OyDQnK2mpvSQ+MSKnmHsVrMQxlQTV
	syUokA4qXdNDFXfJQDxD7EbFWyspidOUuVegqe4/WNNqlOCtZXtkBKn5AtPsuH/3
	XEUQAc4DfVTSTI4hSggxsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780463008; x=
	1780549408; bh=ws8WYd0GmictUe6BKqpSaYsPsRCChPwQW2zOOHmZTtI=; b=Q
	dOGvx/G50SmERWUhnOoqF2ksaK6kgCS5emFLHyRlgpx2okwWIL+C3ks/Eh69CQEZ
	C9kN2FDvYNWZN7Q+3zyq970K2PIsBQtHtEDUYL2JekFyYIRhz/7zIqofu9VShDFi
	cT6MMZk3EGYMhkvjA18Y8wpsDcNDZ41C8v990KywC2gC4mVPiOH22X0dTENlDQyH
	oZVXTymoR4trgGXMj9xRA4ZIg75O+XSOU/RL8dIJf3qTi0M1yt+ffqmunovLnijd
	57wNBrtpM2igRgTa5GXcrqnkt/SQRduAl/Hk6xl4QyEJJ9B86ocGeDJjx38yInuV
	txTLEkVfg67cDm8I42Uiw==
X-ME-Sender: <xms:n7Ufamn4wGCFkOLYur36qfJv7gMFG4XDaNGmjXa8GCNGPCAM_YSF7g>
    <xme:n7Ufaorusnsn54exwvl_wZkiEfYXqB9gY3agwHIMLMKq9t0Wjz21E_RG6kR4_zYJn
    1VoEMmBTQy-mZ1lWOgpRVzFOvKyeOaShj1L9LYYA94fg6Jn-QkjpeQ>
X-ME-Proxy-Cause: dmFkZTG0t97FO8yBGoorBAhMOqRBb3alUoZWCa+3FbQIOQ1ecDaQZknDEG8wPLN47of6Qc
    qv8GNBlEa7129jM/G5h/ymEOKN/qWhvSBPr809D3bXUnBhUVSIetxDw5gI9L+ggji/9d4x
    XO23msHo4xmh48D3m+hoLJm1ifsUWRS+YwvZsrSuink1mOJ648crkP6DappbFiyLAnHoL7
    u2LT8AhRmJjtX5yfdItOxZdShubzgGfyA5vlOIFPvF8CGylFyVfd8rpHNHNR/SIbWGbiij
    o87E8okkNz/sbi5Exfz+qHHOOzOSon8OWrXE0gr1oLTim1VqMnYxDscYj3AAPpMhvBS7DC
    eKaEGSn4i/GW3m+Ob/H2s9jM6lJK/IV0cIWdkATFCwd3RdF7ObjdwZJzyzuUF5V0QD/OaQ
    N1FdjHVpUl4sTIkax0JMHmlamYgV+bSJfITncGh6qYiHWIj3pg8sB76OC2HWuqDvF08Trh
    o5+dvAZPaR5vxRNTPOF3c1HG5SbNq0LCco214Hdz/Q4aR89jn4om4UyKMbrSWo6189OLqr
    K3g4pLlRqbddbqEtrP9tKYR2gi5vsv7UKss0fZlbCsfm2TaifDdU+Sr/07OlVyerck3UqV
    P69iNt/00kAssNHubaJ/OGGovt0iyOQynklTwUOpKkSBvMADNRwab8cBHUuA
X-ME-Proxy: <xmx:n7UfanQ0vt2oWI7qTTrHgfqwFi4hGup8-tjPLQN_-druOHYh5BN0XQ>
    <xmx:n7UfanAThaLdfgg6XGWMCj8V9TqPsSXZisYBSS82ZdxlHyZHRcO4xA>
    <xmx:n7UfamIqrsQ-V7zF-l-f3-gboQjgfTt0auUy-q6iwOEZM7kpDQDloQ>
    <xmx:n7UfaqDqeD0Pn5xS3MVCPr9Gvv9bz3lWbG_66xEjpXslmFBy4S5ijw>
    <xmx:oLUfapqEvA8Ohh1bza4XJuwhIpgLAFPm6HQt92a_LGLL1AYcAc8kZcrf>
Feedback-ID: ic2b14614:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9C6812CE1D5B; Wed,  3 Jun 2026 01:03:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ap04_Nb3JT2V
Date: Tue, 02 Jun 2026 22:03:07 -0700
From: "Mark Pearson" <mpearson@squebb.ca>
To: "Kate Hsuan" <hpa@redhat.com>, "Damjan Georgievski" <gdamjan@gmail.com>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Hans de Goede" <johannes.goede@oss.qualcomm.com>,
 "Hans Verkuil" <hverkuil+cisco@kernel.org>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Serin Yeh" <serin.yeh@intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Chi-Wei Chen50" <cchen50@lenovo.com>
Message-Id: <38ba48b4-35ec-4514-b805-74ebfc17b328@app.fastmail.com>
In-Reply-To: 
 <CAEth8oGOEdN9wf15FZ_z73pDj9Hw0+zj_8fd_ZMbMwMkBHrUPA@mail.gmail.com>
References: <20260522031121.11968-1-hpa@redhat.com>
 <20260522031121.11968-2-hpa@redhat.com>
 <9727b97f-7838-4d5f-bd8a-e26dabf1d38f@gmail.com>
 <CAEth8oGOEdN9wf15FZ_z73pDj9Hw0+zj_8fd_ZMbMwMkBHrUPA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] media: ipu-bridge: Add DMI information of Lenovo X9 to the
 image upside-down list
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[squebb.ca,none];
	R_DKIM_ALLOW(-0.20)[squebb.ca:s=fm2,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hpa@redhat.com,m:gdamjan@gmail.com,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:sakari.ailus@linux.intel.com,m:serin.yeh@intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cchen50@lenovo.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63477-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[mpearson@squebb.ca,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mpearson@squebb.ca,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[squebb.ca:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,app.fastmail.com:mid,squebb.ca:from_mime,squebb.ca:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72321634353

Note - switched to my open-source friendly email account.

Hi Kate,

On Tue, Jun 2, 2026, at 2:35 AM, Kate Hsuan wrote:
> Hi Damjan,
>
> Thank you for your review.
>
> On Sat, May 30, 2026 at 6:33=E2=80=AFAM Damjan Georgievski <gdamjan@gm=
ail.com> wrote:
>>
>> On 5/22/26 05:11, Kate Hsuan wrote:
>> > The Lenovo X9 has an upside-down-mounted Sony IMX471 sensor so the =
image
>> > was displayed upside-down. Add the DMI information of Lenovo X9 to
>> > resolve the issue.
>> >
>> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
>> > ---
>> >   drivers/media/pci/intel/ipu-bridge.c | 14 ++++++++++++++
>> >   1 file changed, 14 insertions(+)
>> >
>> > diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/p=
ci/intel/ipu-bridge.c
>> > index 32cc95a766b7..1c3364451fa3 100644
>> > --- a/drivers/media/pci/intel/ipu-bridge.c
>> > +++ b/drivers/media/pci/intel/ipu-bridge.c
>> > @@ -118,6 +118,20 @@ static const struct dmi_system_id upside_down_=
sensor_dmi_ids[] =3D {
>> >               },
>> >               .driver_data =3D "OVTI02C1",
>> >       },
>> > +     {
>> > +             .matches =3D {
>> > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > +                     DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad X9-1=
4"),
>>
>> Isn't this going to be an issue in the future if/when a "Gen 2" appea=
rs?
>
> You can look into the v1 [1]. The DMI_BOARD_NAME is used to
> distinguish the types of X1.
> v3 covers wider ranges of X9-14 and 15. If we agree with v1, I can
> revert this patch to v1.
>
> [1] https://lore.kernel.org/linux-media/20260417083214.222189-2-hpa@re=
dhat.com/
>
I happily defer to Hans on things like this as he has way more experienc=
e than me, but we usually use the BOARD_NAME for identifying platforms e=
verywhere else in the kernel so that feels to me 'safer'.

If we do go ahead with PRODUCT_VERSION it should probably be DMI_MATCH_E=
XACT instead. I think that will work fine, but it is not commonly used a=
nd I would worry about the FW team doing weird versions for different ma=
rkets (the two board names are very standard for Thinkpads)

Mark (currently on vacation - so replies may be delayed)

