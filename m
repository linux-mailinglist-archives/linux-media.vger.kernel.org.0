Return-Path: <linux-media+bounces-27471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5162A4DCF1
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 12:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9BBF188472A
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E11A2010F2;
	Tue,  4 Mar 2025 11:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="nwTDo26F"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2071.outbound.protection.outlook.com [40.107.247.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A771FF611;
	Tue,  4 Mar 2025 11:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741088954; cv=fail; b=kiWk6vbx7Ybe2ByDuaCWPxr4xAeIlBDazbSX2E3frfixWmE2dfXMTniWZd0xxDr4GTByI+IO7xlKkbaJxiZFeCVBTnwJgzN8oCVs2NyzBVS7OMwV/fErQgQdnhlcK2GJRq1lkm/zsg5aEuo8QvLKx5+l+FN93McK511OLdKkxKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741088954; c=relaxed/simple;
	bh=7vfjD4A52sc95y7m13DomsqLTidRmIf0JaSdAyJmqUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AcRqRERM5vQKN4cqS84xvc7jxj1Syu84Mv8cZH7GPL/oNwafpymf32Zx1HCX5T1kvIa0XyVLD7A2AF2fNQ7nPUoHG+pQhvetSribeCbTz3OmDQtrx7j50AuA7KsVHlGSkJ4oYdOchevhUj+uhDqACJ+Md64QBhaEsGxa0mCPPBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=nwTDo26F; arc=fail smtp.client-ip=40.107.247.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elE4H9EGbOD/NYywcZ+l6Gbjn8EeCLY2qUtsJr1tticaZqve/Yh2rBFwNMTTVcneP0ZAilwbSnQ1UtQ2jsrZDK4dELwLMl+F1C2bozNCgfCS3ERFBjpjvp3DNNYDBmHgbQr3f24YVkTfHkLT31x/85mdSk0zSaTc1G/ojtw+qSZzdwpAuPxl1TirsnG2ZYARKBX8kBLOt+j6EHC6aqPNyy59NXcGGtfEFW7qDzLOyZSR11sq6HBanUEnwOPmPzzu+mZIitosNzwwjZf2teMVb/8l8yVkvbdpBgLf2lFkxOpLh6f4GDGp6TTvN0TauDETpB1ddvQk+EW7n9wXUWoiQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQxbEuA2P55FVhh1BLmAhSwua5RWwtkqPJlTpQa/FMk=;
 b=fxTKM+4q20Q2lqZncj0vk4e8TQD1eQM2BkX8xDuVobeDrZDErGKYKLzWr/Wbq/BV5pzywSzxbJuH0FkfYwWnj7DQxdbBaNWavmwYJzL2RK6VD8RWUZNsjb8kWuxRdresKhWEFDmPSrhHjW9WUOhj/4fXs/p821hIldKQh0w1xJ+wO51jQwnfGgMZDQPVk8xL0N9ImQ0d7ZRF42TPQlk1+d2/XZ7LD7YoyM/R3ybrgyfuobDH7W6V/VLgU0ARKbhen6Jv89L65riLsjp+wjwrC24/MsxemeU/vFxMHthME3s9H/RqG8eGLL8ig8j6c9eAZ1AbmIbBX+KJ08fVdWV8nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQxbEuA2P55FVhh1BLmAhSwua5RWwtkqPJlTpQa/FMk=;
 b=nwTDo26F4ZNW+7kPd7lzMlg8OhMBZjM8CAcb5/5oKHjVS1S2ELBydD3QhWlUkhHb9se+iJ6LSz6We8mi/U1tpn9WbAXVpZqgzqwzLY4lWWymb2jmWw3iloJIJ2VntzcGE6Qs2/mp1xelDbPMfAcxUCTnDV7uMH0Z9LSypTmhxedZIcM/PthZcXZj8rwhVZkP5hwjebKMJ0+DGsAw7pFST9YXVsAAAMNuIaHH6wGiXPODeeq4LdflUGKp9cfSXDV0NZLlfDBMVOFEqd0G8QORS49UfC2QT9Fm0mafRvc/7opDQr/ixmX6revBNlWusGXRYgBlFIFHKeSOqIDFcR389w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15) by PAVPR03MB8948.eurprd03.prod.outlook.com
 (2603:10a6:102:32b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 11:49:08 +0000
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd]) by VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 11:49:08 +0000
Date: Tue, 4 Mar 2025 12:48:58 +0100
From: Mathis Foerst <mathis.foerst@mt.com>
To: Conor Dooley <conor@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	MauroCarvalhoChehab@mt.com, mchehab@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, manuel.traut@mt.com
Subject: Re: [PATCH v1 2/8] MT9M114: Add pad-slew-rate DT-binding
Message-ID: <Z8boqvxEAhx7rG9Q@mt.com>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
 <20250226153929.274562-3-mathis.foerst@mt.com>
 <Z8A66l02Et4J7hj4@kekkonen.localdomain>
 <20250228-helpless-delivery-42162772caa3@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228-helpless-delivery-42162772caa3@spud>
X-ClientProxiedBy: ZR2P278CA0063.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::7) To VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR03MB10400:EE_|PAVPR03MB8948:EE_
X-MS-Office365-Filtering-Correlation-Id: 39e9eb61-bb14-4491-5731-08dd5b12926d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JILRUtuXcnSCE6Vp6cE2pWJT7Lq68jmpnLd8j8t9VKBtj2PNh6Gxtl1u1F3F?=
 =?us-ascii?Q?SY5QK289crAaniogoZpOhZ5sSOHZr39652elL+ZkdQ+XnKYOSWmtfmHCbDTo?=
 =?us-ascii?Q?R5dr2HNOEBKJ9n4hv4DH8MVo4f3lE/3TkOHrprwPcMBqFBqRyw7qZ/g8aNDX?=
 =?us-ascii?Q?zP1dSxPAYw594qbcMCxlADlEU/yhJhoqnTKwcJzqycnncf7qP8oI7DDXePWO?=
 =?us-ascii?Q?zD8M/v359abNBbS1Nc5RgVTfxYhhBQNY8hlhkvCLJsVEaUgW6Lj4hk+qeNHy?=
 =?us-ascii?Q?5x8h4NXCFRtGyECdi1Ym1fMdvgeZQjiRZjYm42wdyWZXzZqMQf1U262ZpTUg?=
 =?us-ascii?Q?XvwqfNLNKTZWe+4/yoxiX/f6j2bo9y8IJFRGCz6jFTXTKhfw4A8O+M5Xpdd3?=
 =?us-ascii?Q?n4Jfuc1/wElxd3bbrDXehCj1vFCXzntC979oEIKE8h7WjYE6Z90RxeHgAgA9?=
 =?us-ascii?Q?j2CmtCBxEC0Y13eAAubFvqnGtrJDqVu9sVK+EOqqrBNB61vsHwS0gbI83I/I?=
 =?us-ascii?Q?wKbShwBSOUgFY/omphWkGt3kmVsTaqGQe2Ix3CFBXuZqwDnw2DD6cHrGks6u?=
 =?us-ascii?Q?8x56jQrify8coyTN2QJ9InST7pNfCuPbVvgWzybrFK20tt16gMNivurX78qh?=
 =?us-ascii?Q?s+Z+lZc+8Lg/PLFqJjtZ3hZfTBdqgbeafzxWPTK+3IPLuW+mhmDwbICAniOI?=
 =?us-ascii?Q?G3Xm9Ewmo7pwNjL8mc9wD95yc8T+D7AAUDK5f3OFDQf8l40bsrBvgHZwoB2a?=
 =?us-ascii?Q?cqy0yWM6fTY3Bn+gsDSMoyPNlxWpt1btrUzgaddeXanL35lz8N8gu7r6ICu0?=
 =?us-ascii?Q?tDmex58KBCIycDerwU0T+GPJKjSVORXHzJbbgsJS5PfQcFGCjCDvLrnkRtfK?=
 =?us-ascii?Q?qcdh9RGM8F1UUpEgehzRAtBcdJh/sH67hkBq8yiZyaGcXID/AHMIAdk7tXdt?=
 =?us-ascii?Q?ek31Xc4Stngqq6eSLhifrNPN8bGEH0sr5uOH8FeO15KpoeufZia79e3Dl1Vd?=
 =?us-ascii?Q?w/thqisWwyaFroPL/PTgtfK+S8npQ/jeEKFI1u8d8TJHD/dX7P3RT+z6oy07?=
 =?us-ascii?Q?SiI+bRls77sIqZx1/PhbhMMtfcGzU0ylc4PaISgoMs1QuYg6DF2P0opOyJPp?=
 =?us-ascii?Q?kFIcO3SiJiOb8zKFEalGlhmOvJj5T1D844j4uQTuOWgW14sNmdjAekXxH9BT?=
 =?us-ascii?Q?6USlUu4Gqeayc7aq0V2KTLQzbAwnBr5AKeMyTCzGqh6NGU+p8O1UqyjoVkQv?=
 =?us-ascii?Q?xVhAWn6qeMrfV4Mkk+B6Yn401kmiWVPKEr52e+bpHcF2sfCSr03Y6R4ULCmb?=
 =?us-ascii?Q?p4qAUFN6G24aRRX2i4+NrdNGeiuznBCD30aR2cJWtiB8dbbSfq4+meSKhJxo?=
 =?us-ascii?Q?pUeCTv/y7TbbhtmUHr5Oi1niE5bxbqmrFazpB/85e1Mb/nWaqydP0LPZ1MSl?=
 =?us-ascii?Q?8vNBDxOq0/lEid5QhO61CD9NdOyZZTVy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR03MB10400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QYILt0Y0K8KDMgu29BPysrSjbS74WHXcz68ui8VEFZQnwGvFH6KEsqBXsOCW?=
 =?us-ascii?Q?Z4Ih+pNjEGZ8no+dyAu/GUfQtPLOmvd+JR6fkLyoonA/E0/5i+rF3JLEja/7?=
 =?us-ascii?Q?pKRf5io/U4QzoIA/bbmTJZXKk6FKgDvQcOS0kNhoouIwR++WOfQqa5Q0ks8p?=
 =?us-ascii?Q?xhOJEMfQ88Prxt/bJNC+7E8arsTD+sh/Ush+zlgr5FVbpfgT3IT2D0AqzE90?=
 =?us-ascii?Q?buRMcolWjpptqbz5ATSKrkmaZpL/mk3ODqOOY6QZSkjehWohT1xGWVERRn86?=
 =?us-ascii?Q?7eZWEFqQ4h95p2Q98gXnOy3oq09rquqpCC8KeWd71+KL5OSys9cSHsT89Cd5?=
 =?us-ascii?Q?/xsfrrTF6B1FZxAgEbE0GYtmoeJTacSP92IQx26x3jjKq0fER1YHSCqeg1h0?=
 =?us-ascii?Q?+/0qX2mhBzyt7T8SC/1iAgEwSVDZGCQ6oDWBrUYbQgsJ0rzg24y/V/J0V/lv?=
 =?us-ascii?Q?jbCjxtEz5xIoRmuvL23YDkv2a+fcRt8sjkuU4+7wKLlcxivtP8rcd52EjUm4?=
 =?us-ascii?Q?GyB8XoMRk7MCqrZaJZt7GFq4e7gnSU0sqwTLW4O3cQJRVCQbmhQ3p4PTddj3?=
 =?us-ascii?Q?AxnaqaGKSm0UKLJMAZTQZcIs4ZxdIbhBEasm6y1PzkXwUW3AgmfL9yuV/keK?=
 =?us-ascii?Q?qAQ+KOU/LrrONnQ1UrWXwVmJuFcsF3aSHQzCmCKnRorGqppySfuCnrDp4zyN?=
 =?us-ascii?Q?S43SOV+n6arO1aapyujhSBFk4Cath6q3ZlAiALBtAjHHgCPj7GLfeYeW8Qku?=
 =?us-ascii?Q?jwGgbiNQX/KBAo3/f8/uoyj7YlvM5mw+GZwLR4EStKiGfY7lYnRniDhLtx3a?=
 =?us-ascii?Q?QetzYez/iB5H6ELksUzRJr3WO7lU1NH+ZpZJ2dBB4etJ9KyLreAdogBKnS25?=
 =?us-ascii?Q?eblpAR+PjayfWn+VzmUWn3cpdTGr9FPFy7l8eMzn/8K6l3qsyZmjgp04Sjko?=
 =?us-ascii?Q?yMjEQp/8tl6VXqbUigD9+/G19aMJmrs1YneHmDud0YaXcceOledZjsxaRf7f?=
 =?us-ascii?Q?7KxgIcrXSecH5XSBR9yB25RXv/71R1kttVZEeCpZpQrYx7M+45OBGz4InzX1?=
 =?us-ascii?Q?Jfy4f7Enewe3BvuiR6I3Up9RxG+FfXwXpNnUv6fWI8Ile+1piF/4gic56ffG?=
 =?us-ascii?Q?DwaLUncCTdDRJCtEg2QYwuU3rr7cGwsA+2YnOkkr5znjJo9t9Cr4ek32qDNx?=
 =?us-ascii?Q?4RTjvtzpCgoJ1QoxE1u40FZQ3jTjg445Pmf31/Nl5scU9hJZ1UliJPCzCFrI?=
 =?us-ascii?Q?Yr9OpEar8m3nEhjSwhf7II1NlAVNQrHlAWHnaSj+7Z5QxnCN3SUuTaNdDooA?=
 =?us-ascii?Q?PHFiUx9XIJkAXfr2Nr2xoVB4wd1BLF58vJBZd82gnoIGrMHVMVSAaRGJx8qE?=
 =?us-ascii?Q?qFlETNV2TVT6jHwn2C7PmZ1tPvOTN1ZDcKNlkAPQ8ByEbSVdR5C04ieVItRB?=
 =?us-ascii?Q?clAPMQy4oLgE35XmKsPLBVA0dxCfkzIVbWtYvsRMoy2g0LhR5ZqeunJDpiVD?=
 =?us-ascii?Q?olOx9Clx3psruUHcj2CNx6zHMAZdmO7hW8boFOxRFZwYagrpGZRYC3b9IwYb?=
 =?us-ascii?Q?gXJSYK5aX7FXpgEAicEX8HrBjYxbQrN0htkvHzFp?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e9eb61-bb14-4491-5731-08dd5b12926d
X-MS-Exchange-CrossTenant-AuthSource: VI0PR03MB10400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 11:49:08.2641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8V+7p69s64P6RXcYkuIZmk0QBfEYf2UrhhojheZgedJ78dWThBNaTdj8KC4iM4L9CTOt4X5kx87gz4KP/ufyZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB8948

Hi Conor, Hi Sakari,

On Fri, Feb 28, 2025 at 07:11:31PM +0000, Conor Dooley wrote:
> On Thu, Feb 27, 2025 at 10:14:02AM +0000, Sakari Ailus wrote:
> > Hi Mathis,
> > 
> > On Wed, Feb 26, 2025 at 04:39:23PM +0100, Mathis Foerst wrote:
> > > The MT9M114 supports the different slew rates (0 to 7) on the output pads.
> > 
> > "the output pads" probably means pixel data interface (DVP or CSI-2)
> > signals in this cases? I suppose this is about clock modulation?
> > It'd be good to say that.

The slew rate defines the slope of the voltage flanks on the output pads (how fast
the pads go from LOW to HIGH or vice versa). I tried to clarify the description.

> > 
> > > At the moment, this is hardcoded to 7 (the fastest rate).
> > > The user might want to change this values due to EMC requirements.
> > > 
> > > Add the 'pad-slew-rate' property to the MT9M114 DT-bindings for selecting
> > > the desired slew rate.
> > > 
> > > Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> > > ---
> > >  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml         | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > index 72e258d57186..666afe10c538 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > @@ -74,6 +74,12 @@ properties:
> > >      description: Bypass the internal PLL of the sensor to use EXTCLK directly as SYSCLK.
> > >      type: boolean
> > >  
> > > +  onnn,slew-rate:
> > > +    $ref: /schemas/types.yaml#/definitions/uint8
> > 
> > No need to make this 8-bit (i.e. just use 32 bits).

Okay, I thought 8-bit would fit the small value range [0,7]. Changed it to 32 bits.

> > 
> > > +    description: Slew rate ot the output pads DOUT[7:0], LINE_VALID, FRAME_VALID and PIXCLK
> > 
> > Please wrap at 80 characters.
> > 
> > Is there more information on the effect than 7 is the fastest?

There is no more information about the exact meaning of the values.
As described above, the higher the value, the steeper the voltage flanks.

> > 
> > > +    minimum: 0
> > > +    maximum: 7
> > 
> > Please also add a default.

Sure, I added the default value 7 that matches the currently hardcoded 
value in the driver.

> 
> It'd also be great (IMO) if it were given in terms of actual units, not
> nebulous values that I assume to be the register values.

I agree, but the documentation does not provide further details about the
unit of the value. So using the register value is my best-effort approach.

> 
> > 
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > 
> > -- 
> > Regards,
> > 
> > Sakari Ailus

Best regards,
Mathis Foerst

