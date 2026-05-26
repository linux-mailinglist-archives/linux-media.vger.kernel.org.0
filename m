Return-Path: <linux-media+bounces-62774-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK8oDORuFWpGVAcAu9opvQ
	(envelope-from <linux-media+bounces-62774-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 11:59:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBF45D3D3F
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 11:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03ED8300EEA3
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 09:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87303D966B;
	Tue, 26 May 2026 09:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pbQ4iY2P"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012024.outbound.protection.outlook.com [40.93.195.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A4B3D1CB2;
	Tue, 26 May 2026 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789446; cv=fail; b=APYVjOB42ML9dkg9w632nTl64su609CfY6xhs5WhuXvMNj/n2kJ7BJDlTJoT0c8vNp4QEFCd3FDNfw++WoKbeWnSTWh2yKQWMTqY23na9OgnuTQ2UfIrYnajWPQhpY9KtKMWR1SEhzetMhnI8EGawLzgU2UUQ8DAAkYlEt5ZrGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789446; c=relaxed/simple;
	bh=7z/pKHE3cJbD3tnl4HjCkKQ9uw72iRev65xfDaWAQIs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=owpoFOFBMkoETszxr0eunag1qSvf6tWLuoCXHbHtqiDHjrDL+l9YLE8RayDMDppFqSZ86PysqaNCEEPfJmjxs2fdnZzgOVNt6Mkud0Qhu5u4kGIboI2qVRip8ymaldrNAiZwgcyOwLygrscZdCaMZSLVQnJ4E+JE7jx2IQJaBfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pbQ4iY2P; arc=fail smtp.client-ip=40.93.195.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BowzXS41HLCkPKJ7x3btr52DHUXfD1wUNhmvyVhD8TAI7/8mPcwhgs1DSrOxPtefZ5G3E/3rONntg7uG54adtdNu2kCIIyH6mGH6jQqIpT8OooDnIT0i3//9ydRVyCsytAAQXZc1zn9VRjOgukl9IHzIA9KHgtdJmjM6vA4SH7fbSah7us8eeLA1LoYGKJ6bSTHvKlKCAceBFlMmUCWD1ZORZtvThi+XiHyKq4+OzFv9vo4NxeUcOp57m3B8wtKpZNQG7ghBpfQEUiPDr7qrv28G5tiXoJn3O4OUYCHb40UErjIODXyWEbtQydbWWNEJpDoGv9krO9hUEo25c4y7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sc5FZdIUjd/1zPKJgArtd00OiXsaNGpxzu5axFRrm/U=;
 b=euXgktN8XHEeT5A8Ubof3ICYLUT7weNk4t4h7dJei3zhYF22i4PqQHtJ3NHqqZkIs6kE47XiSO1Dcn6o/NeY1AJxpmyM3J+bSNlmNXrAm6DibjOFRRW1SGreBT1DXduDQKkiqi90Wt0uaWgdTVB+VhW92C5x2BNAACTSvydsl+FlYGbKTArfD3ix4wmo/GuGi2kzUmoKoNET8s2EmwbzWgZhLWghOsK5roDhC/CfualP3SpD5AXbd/V+AUpifkL+hUOp5ELFkztmyUMLIHE9PPoSLFzb7LICz34huwvRltwdeVuF2i7hLCdwp5TxeCotYiJzE1YaULco9Wp4EsBejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sc5FZdIUjd/1zPKJgArtd00OiXsaNGpxzu5axFRrm/U=;
 b=pbQ4iY2P8X5dsUGhIzdRyoqR9X5aVrEUtmZCGtACvZP/whqahEM+lVDkzLQIsLiAI+EqDi5SbnG/BIIuk4ScyWu14CAkCP6Y6UhFsTZj4Qj0Wb6MzG4plOIOYIJSHuRHte3qNTn4yGd8OxX8n2nXBaVc/O830U0ynBgvVYXMbsY9h8bAqvwZF+0O4HnbUcsGkxETmhuN9gN87SiE6fE7e1hECpkuA//57Y4RoPZU1dtcawyQpzO6tjUsZaiQBOzLquURjKCSyioJkSaicsqsWBThNmPwW9NdulySpIvOzcdCkS6JUbU4eCze5xjlDP3zvKoHi51yKyD+cLc7Z6whtQ==
Received: from SAWPR12MB999118.namprd12.prod.outlook.com
 (2603:10b6:806:4e2::13) by IA1PR12MB7589.namprd12.prod.outlook.com
 (2603:10b6:208:42b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 09:57:19 +0000
Received: from SAWPR12MB999118.namprd12.prod.outlook.com
 ([fe80::29d3:5625:9339:d4ba]) by SAWPR12MB999118.namprd12.prod.outlook.com
 ([fe80::29d3:5625:9339:d4ba%4]) with mapi id 15.20.9913.009; Tue, 26 May 2026
 09:57:19 +0000
From: Henry Lin <henryl@nvidia.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/1] media: uvcvideo: reset interface on bulk stream
 stop
Thread-Topic: [RFC PATCH 0/1] media: uvcvideo: reset interface on bulk stream
 stop
Thread-Index: AQHc7HNZ+U2PWH4GIEyVP7J8a4HKY7YfI8YAgADu6iA=
Date: Tue, 26 May 2026 09:57:19 +0000
Message-ID:
 <SAWPR12MB999118E0025A141D7F982482A6AC0B2@SAWPR12MB999118.namprd12.prod.outlook.com>
References: <20260525182028.2148267-1-henryl@nvidia.com>
 <3fd4f5fd-5a52-4584-85b7-1c3b76e7285f@rowland.harvard.edu>
In-Reply-To: <3fd4f5fd-5a52-4584-85b7-1c3b76e7285f@rowland.harvard.edu>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SAWPR12MB999118:EE_|IA1PR12MB7589:EE_
x-ms-office365-filtering-correlation-id: efc149c0-5a1b-4acd-309d-08debb0d2ce0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|22082099003|11063799006|18002099003|56012099003|4143699003;
x-microsoft-antispam-message-info:
 Y8bZ4EryWwFkC6clsAOQob1/InxlqgnBi9VSHxu2Q7faGm0brdKiI1ZkP/mO+fWCLSFoulujOqNjEpsW4fJDNqzVLJc1E4HDSAOcCYYaOcW/iefd7AWkRjrZNwUobQkw2C/vg3OcV9dzVBGDyL86GjjIhn62k/Onw1UuCPrAMO6nwPqN87qVFhBF2qWTQv0llaEBPM2UBhYjncmX7DjdeTbS8s3rPnUHcVVE+tWK8oD8PiPJNKxIDwzg9hKMqUXC6fJqz0rTbTBI87uks7MgE3NiAeV46qmYw6PekbD50DObfxY2QtpEedbHeU8JWcRGCAS47wV+prrQ+uHSa16eG/n2jhikv3oVRFKNE8jatUg5xhMEa7fwkBAskUR8no1/+4iQ7wvaOD4kG7RtrnX91IPNX02aijBDMX2vs+hvul8BQslkdIbO4DsZRglTtSMmbxgCRRjHu43TVY7GBbo+IQNQpOV72QnILylGqXN7Irax3A3hPgATAyf8MLkSoEEmszhCb5vd33oLP0mcFoS2sY97pQtbm2pQyQmcKXD+kG3uJTHQwdiWY4S7OeEWgfMZ7vpU0hIcH3I26xnZ74LpF42SJYWrIKiAnAHF6pnF3pZidgveBYyCjSKvaCQvPqe/5KTdMRtfy/NHwVraxoUsVcyjMl4ihcl3+Cca5xiYd1LBVeicNPZYGGIlTwSlXu4yrXXSoGZR+pMnYI5DindJSoKVFvQLEdJObzPPS8MQ+BAB1LX0JVr5DNs4n6IALIgn
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SAWPR12MB999118.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(22082099003)(11063799006)(18002099003)(56012099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?L9PvXwMZPdEnPd/CMWzJwKkx0ks7dELZdUmd94q0LarCcZsVW4eytodLFV?=
 =?iso-8859-1?Q?n/oHS+C/n8CVWrFehunYBsa5IE0oBKITSC0UNRCh5i0DH1OA9rgmdsa2H9?=
 =?iso-8859-1?Q?tj15fEulN566vtihF/0koE2nyeeZ+VHYgNvBVjQJI30cgfIXnTwltXbPcv?=
 =?iso-8859-1?Q?BxDm6mcq8bZzBPcYor+rfV3FfTNzkeXuFZFXBJxzHdbNmi5XuQNikcE6Mf?=
 =?iso-8859-1?Q?/TzSz0sJCrXsdp0xQI6Et1fUvfuFiqwc5eHsIuNiKGthx6WKTy+jFZr/VF?=
 =?iso-8859-1?Q?0hPv4IjUOeqq2noWQT/DEoXfPpWjEGZdoZVlhzDMrglfBpdsN+diyjCCe9?=
 =?iso-8859-1?Q?zSUoqcbc19qMDtDvIRIO0wTlr/pma1ByKJSWpoiJgoVb0h+sM3me5yCCYB?=
 =?iso-8859-1?Q?IoSssYZbRCs8m9f0CL1CdjURzvEqVNZoB0lrbJ3O2njjFV6Nq0fzpAWkXg?=
 =?iso-8859-1?Q?iylaJwQO5Xr3+mtoI0qPtX3QZfenlINJCd6DO9tAkPQDw6+Llc/IZ4VmQR?=
 =?iso-8859-1?Q?35QX5gidJH3NM+6DRIo027SbPzvUmeyOe2gNTi4Nw5BA3L2NQQ2WQz+k2h?=
 =?iso-8859-1?Q?nVclX3oySILiR+tspu7slYgR8WyXhxQkBLmug8DnT6Us0MB2NfdFoNamgE?=
 =?iso-8859-1?Q?qMIiah9DYkbvTNYJfh7F0Lk7AmiLmUD5cZfi6BZdv1JAQOaUN5cUgO+Uyr?=
 =?iso-8859-1?Q?M4AtWtzXL/cjATeurcEUAxPEmkn+NR0bTSLiDI4BXtyxEvfdfjZ4j6KXv2?=
 =?iso-8859-1?Q?ZkVRYsqxtMGIwIb2YKF87cF1GVP2S1xnIaHq9qQni7AWymwFXTh6RM9sub?=
 =?iso-8859-1?Q?iXtPC6cdd47vAi1hbJqvfQ5+byRH9VpDrC/1h9RI/Sb4/mGXEgpZdW5gHT?=
 =?iso-8859-1?Q?AsxVvGjobzJcneGs1kf7bm7m+3tTvyDfs+mf6Ev5g1fWO6uN23mKynHCGU?=
 =?iso-8859-1?Q?dnNhaGHsVPMBHLW7axf0TImQLgWRGBPyak0LD0/y8v0himktfWNPLMTxAS?=
 =?iso-8859-1?Q?ZEGdiHtbeJqLPW586rt8kf6/O1az++3eY258d8ijammbhqXtNe7Fh9lOOk?=
 =?iso-8859-1?Q?LOCxwxJxYMf/I4BznXDy3Dp55S8gdvxrkOaIDnNStF4dp3HVx/K/hNmzRZ?=
 =?iso-8859-1?Q?ZH4/oQJw9ogEjsG4QFCjxkavXsypM/1gcsKOnyTfeTFRgFLiQfvzjyQQ3e?=
 =?iso-8859-1?Q?2bd6cQ1UwANcGjEPJR1Bs9b7p0KGhL+i9Up6BHvgJ9fwqbKLgEuxQxJGd6?=
 =?iso-8859-1?Q?+g8BPjJ3WyqUsYFePDwCnHjHzByip5XnsNYjx3YIDbnr3AuecCTQxBY3ry?=
 =?iso-8859-1?Q?s1crQSZhS5bnQOu5NhVVPZzHTPFyo0aKxnzWDJnDXmm7+0xXH9PXnjA0ig?=
 =?iso-8859-1?Q?alZfm7uJrZrdvQynLXd6c5YeFDGXc3EmM7k/WGc6+cvt8kshL/5PTZqWy6?=
 =?iso-8859-1?Q?7ZSZDqu9dv8TTJt6TFOnMpHVm87vJMsRukHsv8d41N+02AG7ABvGE5j5m7?=
 =?iso-8859-1?Q?65H1wvUH1zX2KFZnbWIX42avijomTOQw3yPpI5vewbFNIIXUabtNrUOe31?=
 =?iso-8859-1?Q?T2k7P5O6Pug1T8igAYfMjNVmwodnqf84a/80VGigg7QW2wpf1ry9SmDjOZ?=
 =?iso-8859-1?Q?lCuZk4niByjv90ZHIEWJzocORxzTwO3aBVUUyVKNyKfgK7bGlAJpg79sXh?=
 =?iso-8859-1?Q?HDWxcOD3XQc68ZKX5NSBjRL2rxoa9Hrt0I2JS6tkNjdNvRoVpypxqpXaQr?=
 =?iso-8859-1?Q?7oyFPHx+t5bdJZNS6/vFaJB1TlROqTV28wt6pseQH475ly?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SAWPR12MB999118.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efc149c0-5a1b-4acd-309d-08debb0d2ce0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 09:57:19.4640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 65OjJiPD9RAa12czYYvRpinqiPcQEnNgkfBGkrdpM4eYJ6e1/mH7M/s+8IC/inWYDKCxDFDOyMafjaYRqnXm8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7589
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62774-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[henryl@nvidia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[SAWPR12MB999118.namprd12.prod.outlook.com:mid,Nvidia.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CDBF45D3D3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Alan,=0A=
=0A=
> How does it send this request?  By calling usb_clear_halt()?  Or some=0A=
> other way?=0A=
=0A=
Yes, it is using usb_clear_halt(). In uvc_video_stop_streaming(), the=0A=
single-altsetting bulk path builds the bulk pipe from=0A=
stream->header.bEndpointAddress and then calls:=0A=
=0A=
	  usb_clear_halt(stream->dev->udev, pipe);=0A=
=0A=
> Are you certain about this?  The usb_clear_halt() routine has reset=0A=
> the endpoint state, including the sequence number, ever since commit=0A=
> 3444b26afa14 ("USB: add reset endpoint operations") was added in 2009.=0A=
>=0A=
> If uvcvideo isn't using usb_clear_halt(), the simplest solution might be=
=0A=
> to make it do so.=0A=
=0A=
Michal pointed me to this xHCI fix:=0A=
=0A=
	  25e531b422dc ("usb: xhci: Make usb_host_endpoint.hcpriv=0A=
	  survive endpoint_disable()")=0A=
=0A=
I tested that change on the affected setup, and it fixes the issue.=0A=
With that patch applied, repeated stop/start cycles complete=0A=
successfully, and I no longer see:=0A=
=0A=
	  uvcvideo: Non-zero status (-71) in video completion handler.=0A=
=0A=
So my previous conclusion was incomplete. uvcvideo is already calling=0A=
usb_clear_halt(); the issue appears to be covered by the xHCI fix=0A=
above, and the uvcvideo workaround in this RFC is not needed.=0A=
=0A=
Thanks,=0A=
Henry=0A=

