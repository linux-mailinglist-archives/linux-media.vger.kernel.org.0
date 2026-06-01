Return-Path: <linux-media+bounces-63228-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D16FuRMHWphYgkAu9opvQ
	(envelope-from <linux-media+bounces-63228-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 11:12:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9859661C2B7
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 11:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03A5D308D1A5
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 09:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC45038D415;
	Mon,  1 Jun 2026 09:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="l269HnYe"
X-Original-To: linux-media@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013013.outbound.protection.outlook.com [40.93.196.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2D3360EFC
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 09:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304622; cv=fail; b=oIVMXUtGaqy7Ibf9iFsTuCSluWimku6uRHNO7PXecgzrX/kz0X42jQcRz9x+gJMft2IDn+Dm/aqlxGTiSqtG12FjTo79YNBEB0mQ3PZ1JXXe2y2vKnBXJJLyhjuIBS6xsC5QfSsf208zyhP3ag9Ko0vBBNYnB3Qx8M62boUhFII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304622; c=relaxed/simple;
	bh=2/d/wfw+u/k0in/6s4Q/NK/4EVyW36erlfqu0s8Jwpo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=of5lt1P0VVzqoV/8qR8Is/A0E2BXnUctJnmiMXlfUtFCyKqvF7p6CYWxIkHG43CREFWGHiv0/TXITbtQpLpnaXmKpOxgBKLLkiwMO3QXxxACDCZ6kb6rqfQU36kSASkCYPtDJ57togzi9C3XT2K4tvA2dzfyxYS/K8vv+yihq38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=l269HnYe; arc=fail smtp.client-ip=40.93.196.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7BWj0v8VEeYlSgU7mUMwOsodZOVuIQ0zyzv+I8NABe1AAwuCJS1QJNxtiSXKFy737+2/Yzlu6AFGuuGCAzll5mnYbfA7Egn1rR5Uhu0beipcCwZsJZ1BpnBJX3kPYgfO74SPl6/S8A8PqMf2HuKb+chN8GQ2AqrbmV9ltcQ//AL/aLH7tJ9nrLBgJO0XvOIBBdJGVupbZKFBvJyTKg/4CgtjFbZK/eIF1CEzcNFy58ddXtRHRg65vJNNGfYOEsLxe7EnDDW4BHwq6z99b6yl0q+l2xod9dJSbnUNTWY2LLo+GDSOiDiJVeH5hdYcaLmuDTU58wI9hxfVt4S6RJdgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/d/wfw+u/k0in/6s4Q/NK/4EVyW36erlfqu0s8Jwpo=;
 b=fhjW59CZhBTk5yaKM/AhF9UcEd+gl+yN+R3TJ13trv6e8UnEQQJq1r9aGbx7Wag+Yc3Fp1HcJkjNl7ceVUKJBBUsmL97KWVQpnVYVyA6Iunm20xnb8+Q3mWdTMRHBiORxa0pNdm9UdqJUmkvHRH9Os0V/XseK+gB5zOKHX1KKtrvVLfmQCkMl8cZDfKMrKwcNO8WpowccOSZoaX+aKqRsP76L7pgocjmruWeSvaFuYU4F1s2BrL/tiHQ9s0qx42OXWZkdn5dxNbrSSMeXoJOvscRMSY5jf+scyOEPao4KzydAy821CU27bs5IvF5iTcYPEtUt5M/rUG/QkyQA39eGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/d/wfw+u/k0in/6s4Q/NK/4EVyW36erlfqu0s8Jwpo=;
 b=l269HnYe+hmilHLAXZ2v/arwLQJWmreyoJVG0hxF6lbhTD8v8TQIUnawhaS6Dlyo67KDtJQ66PyB8LxSzUpQzEHqb8nHvqXWXfqH029HnKmFVCmZXpz6xgXN4M5KMqztNinTWPAmDX7YJGtQMT/zGyAuuJQjGpAZds0ZlmvBOUk=
Received: from BN3PR12MB9569.namprd12.prod.outlook.com (2603:10b6:408:2ca::9)
 by CY5PR12MB6298.namprd12.prod.outlook.com (2603:10b6:930:21::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 09:03:37 +0000
Received: from BN3PR12MB9569.namprd12.prod.outlook.com
 ([fe80::2aa1:eed7:b03f:5020]) by BN3PR12MB9569.namprd12.prod.outlook.com
 ([fe80::2aa1:eed7:b03f:5020%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 09:03:37 +0000
From: "Cao, Bingbu" <Bingbu.Cao@amd.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "tfiga@google.com"
	<tfiga@google.com>, "ribalda@chromium.org" <ribalda@chromium.org>
Subject: RE: [PATCH v2] media: update contact email of Bingbu Cao
Thread-Topic: [PATCH v2] media: update contact email of Bingbu Cao
Thread-Index: AQHc8ZPGyawsf8eYuUWun7yTLn4c0bYpXT0AgAADltA=
Date: Mon, 1 Jun 2026 09:03:37 +0000
Message-ID:
 <BN3PR12MB95698640E1B433B04559BD438B152@BN3PR12MB9569.namprd12.prod.outlook.com>
References: <20260601065555.150536-1-bingbu.cao@amd.com>
 <ah1B9h8baqGqZ8Zj@kekkonen.localdomain>
In-Reply-To: <ah1B9h8baqGqZ8Zj@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-06-01T08:38:15.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN3PR12MB9569:EE_|CY5PR12MB6298:EE_
x-ms-office365-filtering-correlation-id: 8302e6b3-be6b-4bfc-f117-08debfbcaae4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|18002099003|22082099003|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info:
 MXzjzri3AzDJcyFROJdmziH4HBN853CXgjJmoFr0ESoy13FGiBelZD7/5XzrXM4FsdsUzOSesRaTiOGPXWdJpEr7dYt7NGuW5jOWV+3316AkFtkxTT2Wq4DbiU5CC14djCCtPFcLB/vOQCu1diJ/fJBc42FSfk6RGIbRzMsJk4IR+GZ5DY+kQgUtAcQHgyONZZyL4G+kk18HoujGaQTQqBh+6A1mkbjNhkz5QeKFYGdJTqgN3t/5113Qv9gQBmrWFHvcR75DR0YuV422odhTaUXyCuirfwtStqaRfSWKGfUV0vbRzsB/IYQ3VYAqlxo6GgEGwViyM3HshIftSJc7k1hiCdkZxqc8RnPu7+voUh/vy/qo0HBSLjN5mpCqT+xhhI4yutkoso35N/9kMx4wWnGJq1sBeEkbc9vW+oqXkYs8AWvNWadWEQa8kWaAyNaY1AfP4o5CncvIwB3+JXnChUPXiKxY99KYSpu9U5tUPbziw3YRgVl7wmvQAf8P6yOUHuvYwU3VGb8X2XNl/k4yR/4dC6p8Pabs/Y7lpzxkak7Jh/CQoAjwa2AubIif7msT716bsNMTZVR7Hbja9R/9uiakaR/B5FYqVAWGNAwAE5feOsxkKjDraJpkMPxc8a90FVUP078hpj7KeVYsY2agKqQs3fl8o0QIakBojyvwraUnSNniwwgJFb87o5qR/R/+nZf0QPLAHfSNlubNzp6e2GLpIzwSbchcWIVAECd6R34G/7n2g38hDAuGjsr1uqI9
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR12MB9569.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tVCqBiCHH3t+1WAlVTNvfNGLjTHdyAmMR90XjnCHzrikS0Deu4YMHy8x8gpZ?=
 =?us-ascii?Q?0RnftXyw6Jmw06J4TTVmiN1T6F+oxMnuECkCNXQrujvwiez+AFZxsFGDuK48?=
 =?us-ascii?Q?7znwVEzqu6nwZCe16piD4Te11lkvcrCk9C3lWbrKOUzsg47Gn/e1E9lIZmEa?=
 =?us-ascii?Q?+2avXVAJTGH350N7w9qr79bfw3G17Cz3lIfmm8jOXAUTkwCHEfETI86X/8b5?=
 =?us-ascii?Q?1G63A4mGOCxYLabrQilhzcOEHQrk1QCa9JJqg9/Kc7rH9cYPxsYVl3Gx5qm/?=
 =?us-ascii?Q?9qau2r/tJwttmy6cmZDrBsAnPxoYQPWk7UeHsokEkY3zRnvqx3yCbPnpLMTz?=
 =?us-ascii?Q?RFsgjTIEeRxjkRi5ZAyV74zLOSNfsgyjrc2QClyk7d5usSk+jsU1qfg1fgkq?=
 =?us-ascii?Q?wbL8KzCyqP38+Vrofmz8BfKND/WpfLweGJFLXQ0v9sJ3CbG+bUJK0Dh9/+ws?=
 =?us-ascii?Q?g9UdJXozr8nExH8zRVG/fcFZhg4me4oYaHbXJZT981Vw0LUeFbZy722MBH7q?=
 =?us-ascii?Q?gwQLgGM2t+kKIm1soL2IYH7wlWsu6f2l3AQiogKjSYpNiq8iGQmPP0yEJf9C?=
 =?us-ascii?Q?981kaOuOa3xzo3ko2GRqeMZ5hnT1CwhZX0L94LUdAm7DvfIAsnwDVJD1crJS?=
 =?us-ascii?Q?e08iMKXsuVPGoEMLe+NXDiGd2CizkSDOEt/6FeBAvklq5n9kqCVdS1IXUFro?=
 =?us-ascii?Q?mBohZxolrTN/7vutjzrvyG9d7PWQelarJ8hXdQohYfLpXt2y4vP6RFMOSlP3?=
 =?us-ascii?Q?qqdmL+V/Qz2eyrAIRBX3whE5NjW3Ozed7XnRh5fuh7T3BiO/XmKaCNPSc+aE?=
 =?us-ascii?Q?rGZyxMNEKYWntGf9uVgeUU6rKBU1v3SdUCtdmVOt+aqRzS9TW5rXwzl3/j0g?=
 =?us-ascii?Q?9gi8YALB4Pzi+4KlOeLFuHQt4Z9EIaVszu08204HBKkj0wNXdbYSn7BytCyI?=
 =?us-ascii?Q?LO7lezZLA+3i0f0QYqWO6epoy8pHQSe0djrtratHPSDScNVjy0MnUixNEt6t?=
 =?us-ascii?Q?6pE0DtdDxear2eqs3LL/nthGopbrxPm45Ee0qEQqGaASttc31U4w2mwPY+wq?=
 =?us-ascii?Q?YRIU7j2PBe0b88N+7UNVk+0zeECKPGOsKQewRAjuuHcFLUp4asTeV/ALfVpx?=
 =?us-ascii?Q?2rHaIFRwEVhXOh4A2I0EtRDSjNENybZJOGKf9tp7twGh4KkYpJiNJwkClB5y?=
 =?us-ascii?Q?tTs4NqRryasvTOhTPwMLhjdLqR6pJgwCF4DncIKusqRus5nczq0twSuT4TZs?=
 =?us-ascii?Q?49D1ffEHbO/mv7NnwKotW7GdzJn9wV4NSovqYm65mMXRzbNZA/BETVfTpNd1?=
 =?us-ascii?Q?zGvb9LdiCPvNdpFYDups0THRraudvL2pQmhCPVDj9sWJVz3Xcc0wiqB+wqgn?=
 =?us-ascii?Q?OUY0xgPRHZWRggf17EWy1f53L5NuYgGXsvIS3Vo7duC8D8AD8SLKkBvxLDRi?=
 =?us-ascii?Q?9YOE+gKVPps33lmDyX69KD1o1DMYZAFpetZM5+kyNt0gxR2LjZv0LzPe7pij?=
 =?us-ascii?Q?tZjissurKNup+NGkDtccBPGHAlEs+jQEWyu9Sy4n922GKx67ZmvE0d3T2der?=
 =?us-ascii?Q?OQMBX94CwMWk8b+BRblgxe9w6l/yyC/Ml3HJN+4TPCVeZZIhKYf8PU6QXhxe?=
 =?us-ascii?Q?tki0xOvgp1fVAt3MPhKn9HcRDsa2Oglc2I0XIFIJSLumFRtTIsTXPtWDaOlx?=
 =?us-ascii?Q?3xtQ6gVj8Banvt1jT+hbE8ab5/V0KfQ9nGlY720DgDz4yPFg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN3PR12MB9569.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8302e6b3-be6b-4bfc-f117-08debfbcaae4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2026 09:03:37.4964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7xlA3Z2Vgg+k0z3Z9e3h6PuT2tzlhvD0tiOFdOKaq5EWRU6THnbsFfVMZCGjK666
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6298
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63228-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bingbu.Cao@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email,amd.com:dkim,intel.com:email,aka.ms:url,BN3PR12MB9569.namprd12.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 9859661C2B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

AMD General

Hi, Sakari,

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Monday, June 1, 2026 4:25 PM
> To: Cao, Bingbu <Bingbu.Cao@amd.com>
> Cc: linux-media@vger.kernel.org; laurent.pinchart@ideasonboard.com;
> mchehab@kernel.org; tfiga@google.com; ribalda@chromium.org
> Subject: Re: [PATCH v2] media: update contact email of Bingbu Cao
>
> [You don't often get email from sakari.ailus@linux.intel.com. Learn
> why this is important at
> https://aka.ms/LearnAboutSenderIdentification ]
>
> Caution: This message originated from an External Source. Use proper
> caution when opening attachments, clicking links, or responding.
>
>
> Hi Bingbu,
>
> Good to see you're staying in the Linux media circles! 8-)

:)

>
> On Mon, Jun 01, 2026 at 02:55:07PM +0800, Bingbu Cao wrote:
> > I left Intel and joined AMD, so update my email in the MAINTAINERS.
> >
> > For the Intel IPU3, IPU6 and IPU7 staging drivers, I am not able to
> > continue the code review from now, so remove me from the MAINTAINERS
> > and remove the invalid email in MODULE_AUTHOR.
> >
> > Signed-off-by: Bingbu Cao <bingbu.cao@amd.com>
>
> Dave posted a patch related to this:
> <URL:https://lore.kernel.org/linux-
> media/ahiSOvQ2zQuHDHWI@kekkonen.localdomain/T/#t>;
> I'm planning to post v2 based on the discussion and I can take this
> patch
> into account as well.

Sorry, I miss this as I have not read the LKML for a while.
Please feel free to post v2 based on the change from Dave and me.

>
> That patch however is just for MAINTAINERS and I think it'd be best
> kept
> that way. Can you post a patch to address this for the media tree? I
> think
> I'd keep the ipu7 (staging) and Documentation/ changes as separate
> patches,
> too. Tian Shu's e-mail isn't valid either, could you drop the address
> while
> at it?

I can submit a patch for ipu7 and Documentation/ based on your v2 or you
can submit a separate patch.

>
> It looks like the ov9734 driver will be left without a maintainer,
> would
> you be interested in maintaining it? I'd also add myself as maintainer
> for
> the imx319 and the ov01a10 drivers.

I would like to be reviewer for ov9734, could you take the maintainer?

>
> --
> Kind regards,
>
> Sakari Ailus

