Return-Path: <linux-media+bounces-61395-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHboC/BWBGqjHAIAu9opvQ
	(envelope-from <linux-media+bounces-61395-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:48:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 854CA5319D6
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93273302F700
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855243F7896;
	Wed, 13 May 2026 10:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="nW5JYQgd"
X-Original-To: linux-media@vger.kernel.org
Received: from outbound.ci.icloud.com (ci-2004f-snip4-3.eps.apple.com [57.103.89.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF5238B7B1
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.89.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669283; cv=none; b=c8KolOlJZo7lmm0cmPES3GBkzGD+vNZpHD0RXfrmQbogclDt0rw5qg4NCbhrSfyD7vtQNZO3bg2C8oV3qRS7maIby4AKnh5GSCXQqYAzToNGRw4gcvtLYhsOUZ9bKHxn9XFRIbvQckpMpnA4fGKTXg4jqTq7VtkNTprp2dLAr98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669283; c=relaxed/simple;
	bh=L/Z9gU6k6e4i7AdpW08MHfdPkbxdagX9ILHtKnhumHQ=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=FgaHfQVA71mYgQKXMUOXajrg2S2Qnri3ZTp9KPCMTvMRUqUDi4bDmGFihfNtVoCZ+KA/ORwfWl74ABexfzLUwBiwXHTXPJ/7cH6cV19qqHxHUfO2ZV0UnCEzucjUiB3V522O8gywuul4Lj2QVnsSe2gRV14UUOU1UqPcYmCtDBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=nW5JYQgd; arc=none smtp.client-ip=57.103.89.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-3 (Postfix) with ESMTPS id E3795180016F;
	Wed, 13 May 2026 10:47:59 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQxWB1sZUgVeDkETCFNWVgVUGV0AUgNfFU0LUgBSH3IZWhRcGFNFUR9UWFUJCg9HHVgWXghfBlcEShleCEMrWxNVF0YJGQhdHRkKUFAGWxIYXBRcUFgeRhJWDV0JGQhbXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJCld0MX9Kdl1xUx9HCEl1QANbCkcUOgIrD0Z0NXpAC1UOKAU1DjxzBFQHXQVdVlACWlUSBEAIVlBeCF4fTBw=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1778669282; x=1781261282; bh=L/Z9gU6k6e4i7AdpW08MHfdPkbxdagX9ILHtKnhumHQ=; h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To:x-icloud-hme; b=nW5JYQgdyghBsWM4rNbkIAkwS6RsLAdreIvaiuGdk+/fFw32NmW9TY2yO4dhYpd0wevhFMowhT7xRz9807kRdEYtpJZSwq1e8RvlcNHs6hXr9jT/Uk1UnAlrrtwpI0pugx5o0LHMBPU77KYSwQIj9zBKocf961fwP6yvOvfVG6i8u2PaWVYVC04DWEDECGx4Rocr30EAote3AQ5k6HoC9PjHOH87EhdCaMir025n13G65IUb8awPfNPYNaAP3TxoSqAhD5jgEdPonrDXo7OHk8b9eXDnJYKdUnzDbGhD3y/d7BFd1gmTpxIcLQWhlOntDRy7ob4bodx55HV/6uX2RA==
Received: from smtpclient.apple (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-3 (Postfix) with ESMTPSA id 0271318000FD;
	Wed, 13 May 2026 10:47:59 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "M.samet Duman" <dumanmehmetsamet@icloud.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v4] staging: media: atomisp: remove stale "Generated code" comments
Date: Wed, 13 May 2026 13:47:46 +0300
Message-Id: <FAF2E0F8-711F-4087-B1F8-FEC8889C7E7D@icloud.com>
References: <20260512-atomisp-remove-generated-comment-v4-1-4095ab7e2c14@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Tomasz Unger <tomasz.unger@yahoo.pl>
In-Reply-To: <20260512-atomisp-remove-generated-comment-v4-1-4095ab7e2c14@yahoo.pl>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: iPhone Mail (23D8133)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExMyBTYWx0ZWRfX9fpyi5r8TIeg
 3shTq81B6p1RLxyItpO/Qt/AraCPZ40ePIazpgnr9voSnNpaXWkTCjzfbVSxI7ilK+rUWeKvxHi
 Ly6UZ0HxslY0rTSF3s9/UwgaM6kSfy1yF/eYS5eyerGIgWObP4LwMeHc3X1yAAwUtOZgzARbV/x
 mNartaJZRjyMmMlSHAyOhQwswvKdEQpp772Gb/5U1XeJXxszXdck/JFqDBb8huEZBGIP1/1g6Pa
 fbVj1mghKJCMhCJUxp0YghzFojkfbNOk63muYSVamrfGPJTq/uks1fl8zMVI2HT193IObu2aOvH
 DVcV46NVbu63g425mHhfjsL9QtIM99vemVOMqcgLIgKIDCLIrnJ088Y5lbCmIk=
X-Proofpoint-ORIG-GUID: fhbFFq9RK_W9RMz5aRm33gjGgKOcorKR
X-Authority-Info-Out: v=2.4 cv=FY86BZ+6 c=1 sm=1 tr=0 ts=6a0456e0
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=x7bEGLp0ZPQA:10 a=aRhIMoA-k8UA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0eSXS4il8qRmlOZU7j4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: fhbFFq9RK_W9RMz5aRm33gjGgKOcorKR
X-Rspamd-Queue-Id: 854CA5319D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[icloud.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[icloud.com:s=1a1hai];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61395-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,intel.com,yahoo.pl];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[icloud.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	APPLE_IOS_MAILER_COMMON(0.00)[];
	FREEMAIL_FROM(0.00)[icloud.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dumanmehmetsamet@icloud.com,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,icloud.com:mid,icloud.com:dkim,yahoo.pl:email]
X-Rspamd-Action: no action

It's interesting that there's an extra 'm', and I think it must be left over=
 from the porting application they used when they first tried to include thi=
s driver.

--
Samet

> 2026. 5. 12. =EC=98=A4=ED=9B=84 10:39, Tomasz Unger <tomasz.unger@yahoo.pl=
> =EC=9E=91=EC=84=B1:
>=20
> generated

