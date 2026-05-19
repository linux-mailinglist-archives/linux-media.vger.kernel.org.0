Return-Path: <linux-media+bounces-62191-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AItEF7DhDGpspgUAu9opvQ
	(envelope-from <linux-media+bounces-62191-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 00:18:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0724A585833
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 00:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62083305418C
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 22:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8273DCDAB;
	Tue, 19 May 2026 22:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d6mEHiuK"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011034.outbound.protection.outlook.com [40.107.130.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F72A18FDDE
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 22:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779229094; cv=fail; b=uQL381aP/5exgXYQ933ntYgcTiIbJxKkAeFU6+3Si394o5iOtPdLNpku1mSoLtVHmtVA12sUkytT6uBoZeUyk3V9etJfpcGfzd8Wp8YBmSTHe+JS6wSdIZ2y67oMs2arW5SMbvLNDVLxLSQS/yMZ6zzPPZ1UhGF28tUz/b6ZY7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779229094; c=relaxed/simple;
	bh=2+v2ls8DNkBEo9QRRN7dSdbhiINlBlRdcthPSFDHpEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Dag5N/0PeFizHzSjGIQfXig8lYTd9J5G/Axw0i1MBd2ivTyCNfkbhv4ZS4ns5xmzTB5io9p6C8P4MX6hYvqAeog01Ldw/0QMhqzMgtKeY72+iivKn131oEnIRA72Ly9jAl7ZkNdNKaCfnTggxH9sdshZNNn08FBj5RTqpltJOmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d6mEHiuK; arc=fail smtp.client-ip=40.107.130.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5+oR9nAK/8kgOOcGjwyBIA1NPJUmC4hheYnDcmb0ANTQARpbpni8AuG+6jiP/u1we7jA3L8AvwBPr4rLFoIUckdxGn+6avxiVY2F17WkDeYjuxd9yTgq7bd9mgj2yUrMzbGR4Qr6rWkz/dZC/oR533dQ9qJ22BCy9SkAR+BJ5kCe+RgJ7Qe6j/pn8TpMArwdTLDKl5ZtldAYVNOw3OiL1gNf4s4znUfteYsO6oj2LcT46mccYDqkSzYInrxwy5fk+YX0mEROuM1iCYp/ETK93Eralxy7qDGwCgKHG6iaFFFRPK5nZX0BiZgHFmmw785nuY+WG/LC1gamM8vA0H5Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YC91jzZMPdP7KTZfZxPdtUZvHRiG0/Su8h52z5DSOQk=;
 b=peQ+E3kAg00sXrCHVVzE9n1pP6C6dCUCSkAocsV79PPHAwWW3K7qcpHEHfjtvImCf4IHRXSZRH+Xf6Cy9bpKNjd58hqyeLoikckVrX7d0tQKLtBT1OJG9BqCkHncmc9JQzZcD9qgy8bity+llnYZEmvKkVdj3zD05CRSsoMjFrgD8OqErsYmdgn5fno83SpZkv3RQUtFsEI9WBgTu/ct3v6RuTF0omi1iFDJ0tKvCajaaIEJX8BL0IxHXT3MoY0mTFlnWmE9IARaA4+fEEQKj6d3HSTcHnjy1KDjVpM9WH5AbMK1CwyFFSJlSqZYntFTr89PJGwq3FPsHxjylz/+oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YC91jzZMPdP7KTZfZxPdtUZvHRiG0/Su8h52z5DSOQk=;
 b=d6mEHiuKfoTTx3oFy2Vh/BpSBcwcYUaopRrvRXbPFhxQcVVnfPtB2fh4sdrQYRflU33N3XVNtCWuI2npo2SpnD6bJVeu2Kwh+OaHApLIvqvj/cCSygHgpLIbhQADGHrJLg6RUDhJ5J4l9X49QZoa26fmGBjolu+DaM0YCV8+bkZXFbcjgzxT6goTlJaDO3/lA8qAq4lu3okkaNhk3k6aJGr6A1YUAVNcf4JD+oE6OxOMw9B4J3wojIbzpTeB6qOmQ5VYoiOhr8vmAGk9Q8agG1blxggkwnVMGfD3zjc0XQAOnJdrmPRcpVyqhKz0n7imRZVu2tmq3D3jjCYRZgUqVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10771.eurprd04.prod.outlook.com (2603:10a6:102:493::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 22:18:08 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 22:18:08 +0000
Date: Tue, 19 May 2026 18:18:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v2 05/17] media: v4l2-subdev: Allocate frame descriptors
 based on the need
Message-ID: <agzhmlToZJMRSc2e@lizhi-Precision-Tower-5810>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
 <20260518164318.3367888-6-sakari.ailus@linux.intel.com>
 <agzb9SisRMSsyhqH@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agzb9SisRMSsyhqH@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SA0PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:806:130::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10771:EE_
X-MS-Office365-Filtering-Correlation-Id: baa29670-8bf8-48b4-e044-08deb5f481c0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|52116014|3023799007|11063799006|18002099003|22082099003|56012099003|38350700014|4143699003;
X-Microsoft-Antispam-Message-Info:
 nVLvGU7cTH5KK5SlbyhMCuxSjKKYkFCiVpkpwx3AN4WWDp0scYmJhMgnCOURqocqnwvZU1uKGc8AHNi2V/LfxN4HgcV2JL1LrcPCR7oyTM2fg5/Gqd/oz9AekU36gQ1E2et+bbaNYl1piYNt2np1RlQEd+4aWwDaX2fznTsfJfbMDnFT+PXaSL9yNW3khyVfgsEd657dbbgT+FYaMmsYvceatshe6JWQGm4d3ZPCpGz+yRofJcAc8vrMf5N9f/zVqvNcsH6NzCE2HsqdLWil/AcQKvOrlBwy3q1Q+ZszwhlCnoYWbfuu2YjHg/M68KCorxbGEumel1U8wAQ3ybklNv+9bgQ8w9EIiYTb46gVUmRLJhcljoSkaSONT5UkY7KxjTfCUbQazQOIaI/CoJ6c4G3lHy/gSGTWlyZ8dGlHZ1FgVBIox3/KGSPtZd7JAI1T3rmv6c+kUj9cQu7nv8/aOq9PxqkgkDdYGf2lXRdziWUe/PNne1+V6F7eD2J9EVWBk6AtcLSaX2qDgTL5TCjiSrnLTAFl+bXLkyElSI0rq8YY7Rr7za1VCGLwXBvr3ITcEoU147c4dv4eQJtrF04aHEXBzVM1YKFpcEdgScpVXmO5xuylG1jDNfj/1MovUbSYXLbghf/2PMOJFkg+zdTz9NbGT8TN2j9kCYttrGgsFpAryb6SjzPZe2MO4pFA5nD36epv9dWcGQwwBNmXdNqi2tTMvqg9x9BtunpgXzqYPZga5l0jmamSFeCMrlMXmfq4
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(52116014)(3023799007)(11063799006)(18002099003)(22082099003)(56012099003)(38350700014)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?geVaYnap7rtXMujN/B958wejdT9GBFBJpxhEw2kv1wY6z5EcsBEesXhDDLyv?=
 =?us-ascii?Q?THxQZzxNX4LWhFaXccxasiwGGpynbADra1M/zeuFIdBSFX9KPT6v+eWvcvZZ?=
 =?us-ascii?Q?DZoJIrFICZ/UZsONlFymQ0K6JWZ/nR1DmM05Z7dkKK5x/SaqmGOz/rhGmqsy?=
 =?us-ascii?Q?ZDYyJnsAi7qk33d4TlvQhdKr5e+kVJiM21c9MrPP/Cfx3Z+XN5fh2nZ+9+Gd?=
 =?us-ascii?Q?jGSKMyub4EnIYafXPfwLDkgtnF4NaIbOH8p1ouHEQ26Kig8IoZy1dXHyanY+?=
 =?us-ascii?Q?nq2Gb5vQNEhaJoSLXSpmO2HpgvNHGWWtwEbwtL0OIobXHqkd31oFUGu7AxU7?=
 =?us-ascii?Q?oj3QOL2XL4/Pe2sOwGOQUB8IB4qTKv5MVFHFkDawWU+/KdaswS4EJDkGehGp?=
 =?us-ascii?Q?VML0zAansISmyRuiTF1yqo7Q3WAVSK6gH1m12WQZTXThyMw+ojMXQW2hazWn?=
 =?us-ascii?Q?NbQgUomsUEek94ynB0M+If3/vYlNqKOqMBp1useUAr1bxTSBZPK5MhnVvu++?=
 =?us-ascii?Q?YLIcQIE/pMN7bQ8CrSxVavKnExE7Q37C/mHOa7ZL8LJ71jqGr9OkLZtp7eT9?=
 =?us-ascii?Q?19h06c+h4XI4E6m15vdGNPueJfHf81kOKIY4kvdaU3yMfUyC2s0W6ESHpeMD?=
 =?us-ascii?Q?jmks8URXWqHxJYj7Z693OdBpU+kixPzhlrNNjYwMd4rKsyAYfsKAFUo6NTVC?=
 =?us-ascii?Q?cYNAPN6bSQRSJJcQ5czJ4NGuGqYmmQYtN/jD6RvS2pYgb7OCrvyDD4apZyav?=
 =?us-ascii?Q?c9GgYJppGQso6MLV3c4IfFmFVGgkzBKBg0iHrKtle/YXodA6JlL3mGzo6kQG?=
 =?us-ascii?Q?Bml5PnAkwzaZQEJYOYZPePT5782UCM0sUnm/xhD9tXEJvPJpwWXi9Vi4FMa5?=
 =?us-ascii?Q?crkwvMry0R+Wu+EVb3/rvJad9n5TkoWgfNPZuz7j2tHLCXXUW9A7sYvgwhVP?=
 =?us-ascii?Q?wHI3bgb+W0mLWFMIwXjU7fEKYZrEL1kDJNog6vPOY/Gy3PZN0+jRC0szexL1?=
 =?us-ascii?Q?HyXoz3niR24ra+A3w59atw0KKdWnvbUlbAtgnEhSmi6F/SlnlxH/axyH8Pta?=
 =?us-ascii?Q?FlYFv3+Ew8zB8KezKcHSx+nuGFfJzheX4MJi0xVPDEBrKPifObyZ3vTTOvo3?=
 =?us-ascii?Q?lxc+GwAN5isIGQWJdzptNc9Plp+XSGLE1C4yFHvu8efFTahpL2PZEiyo5L8X?=
 =?us-ascii?Q?rI4wkJbw7O6HoAWIxNQ/7A6Cy0qqomLQjlkmWpJcFSje40GNGJvYUcFSIAYZ?=
 =?us-ascii?Q?fc7US1zABJKhsRCyj5/l5cyDmHnmw2kzy4dhRRGAcTdTsb2HauytkBb6XamO?=
 =?us-ascii?Q?XAUQgVHeYxD7PzBplJiBOikgQsNkohvVpNvizwgggafM3VGOhx7Tb8e7m1Hx?=
 =?us-ascii?Q?yx37KkQr8QYEGB9+wa4WVP0m/VL24YQeBBnbhRjn6xLeZ/TsIz9J6vyF0Dsg?=
 =?us-ascii?Q?sK8sD8sV4R06KhmhJRQsdw6GeMpYjWjIyo27/K4TKEfxacNgDFaX7mH/3/HH?=
 =?us-ascii?Q?KMhAvlsROzNLFycckkbPRjdO9msSDopXLexCPp/kXZLeVdLIPXBU+RKLuUh6?=
 =?us-ascii?Q?RGEQGsxVPtugNvEocQLsfFy0WhzDmmxU482VVgB+3CcZVL6aNvlhDS9l9Zdz?=
 =?us-ascii?Q?XKXh1kOUZq9yWd5YrcIO6RwwVxSR9+dPgA985t5Ov67Em8Ce2QZBX6F5FHYI?=
 =?us-ascii?Q?6CIF8BGD+gfnfIyK+Vp1DJqB/PT+zA/7Bpc0TCiVnF/WNfHYMnpFeh+PIMvy?=
 =?us-ascii?Q?tS3Is4Eslw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa29670-8bf8-48b4-e044-08deb5f481c0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 22:18:08.8015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZ0eAkNkY7s9ekGbhSXsZFHvONCv5AecUFo2R1ABB3BwUwMxrigflf/YEnc6nCzTsOjR/Roa6JCstJ3puI/DRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10771
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62191-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: 0724A585833
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 05:53:57PM -0400, Frank Li wrote:
> On Mon, May 18, 2026 at 07:43:05PM +0300, Sakari Ailus wrote:
> > Frame descriptors entries require a small amount of memory per entry (20
> > bytes), but if the number of entries in a frame descriptor is large, an
> > unreasonably large amount of memory would need to be allocated in the
> > stack. Therefore the number of entries has been limited to 8.
> >
> > Support larger frame descriptors by allocating as much memory as required.
> > The get_frame_desc() op can now set the num_entries to a number larger
> > than V4L2_FRAME_BUS_ENTRY_PREALLOC and return -ENOSPC. The caller,
> > v4l2_subdev_get_frame_desc(), will then allocate memory for that amount of
> > memory and call the get_frame_desc() op again.
> >
> > The caller is also responsible for releasing the allocated memory by
> > calling v4l2_subdev_free_frame_desc().
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> ...
> >  /**
> >   * enum v4l2_mbus_frame_desc_type - media bus frame description type
> > @@ -393,13 +395,17 @@ enum v4l2_mbus_frame_desc_type {
> >  /**
> >   * struct v4l2_mbus_frame_desc - media bus data frame description
> >   * @type: type of the bus (enum v4l2_mbus_frame_desc_type)
> > - * @entry: frame descriptors array
> > - * @num_entries: number of entries in @entry array
> > + * @entry_mem: memory for the frame descriptors (@entry)
> > + * @entry: pointer to the frame descriptors
> > + * @num_entries: number of entries in @entry
> > + * @len_entries: number of entries allocated for @entry
> >   */
> >  struct v4l2_mbus_frame_desc {
> >  	enum v4l2_mbus_frame_desc_type type;
> > -	struct v4l2_mbus_frame_desc_entry entry[V4L2_FRAME_DESC_ENTRY_MAX];
> > +	struct v4l2_mbus_frame_desc_entry entry_mem[V4L2_FRAME_DESC_ENTRY_PREALLOC];
> > +	struct v4l2_mbus_frame_desc_entry *entry;
> >  	unsigned short num_entries;
> > +	unsigned short len_entries;
>
> name is not direct reflect means and quite easy to confuse with num_entries.
> Is it num_dym_entries or other names little better?

Please ignore this comments. I understand what's means.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

Frank
>
> Frank
> >  };
> >
> >  /**
> > @@ -781,7 +787,14 @@ struct v4l2_subdev_state {
> >   * @link_validate: used by the media controller code to check if the links
> >   *		   that belongs to a pipeline can be used for stream.
> >   *
> > - * @get_frame_desc: get the current low level media bus frame parameters.
> > + * @get_frame_desc: get the current low level media bus frame parameters. The
> > + *		    callback is required to update the num_entries field to the
> > + *		    total number of entries in the frame descriptor. The
> > + *		    callback shall fill the first entries array up to
> > + *		    len_entries, which signifies the number of entries
> > + *		    allocated. If num_entries exceeds len_entries, the callback
> > + *		    shall return -ENOSPC. Never call this directly in drivers,
> > + *		    use v4l2_subdev_get_frame_desc() instead.
> >   *
> >   * @set_frame_desc: set the low level media bus frame parameters, @fd array
> >   *                  may be adjusted by the subdev driver to device capabilities.
> > @@ -1794,8 +1807,9 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> >   *
> >   * The caller is required to set @desc->type to the expected bus type.
> >   *
> > - * The caller is required to release the memory of the frame descriptor entries
> > - * for each frame descriptor obtained by calling this function using
> > + * The entries in the frame descriptor are allocated based on the need. The
> > + * caller is required to release the memory of the frame descriptor entries for
> > + * each frame descriptor obtained by calling this function using
> >   * v4l2_subdev_free_frame_desc().
> >   *
> >   * Use __free() to release the frame descriptor automatically::
> > @@ -1813,7 +1827,8 @@ v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> >   * v4l2_subdev_free_frame_desc() - Release the memory of a frame descriptor
> >   * @desc: A pointer to a frame descriptor
> >   *
> > - * Release the frame descriptor.
> > + * Release the frame descriptor entries in a frame descriptor as well as the
> > + * frame descriptor itself.
> >   */
> >  void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc);
> >
> > --
> > 2.47.3
> >

