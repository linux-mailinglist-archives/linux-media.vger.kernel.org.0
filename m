Return-Path: <linux-media+bounces-45708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF6CC0FE27
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 19:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3C1D44E4F00
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 18:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065652D662F;
	Mon, 27 Oct 2025 18:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ayc6GHG/"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010062.outbound.protection.outlook.com [52.101.46.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F33419D07A
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 18:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761589142; cv=fail; b=EOqKv42Tm5YX0RxB5sC6gv5FdYUitwThc1NHuPKNMnibblYmQkqC5b1ixv5RV4ymJh1qNkBATgdbB2J28HVTT9X2oQLLyhTTQrdGJtwho1erSi64RLLn50Hd32j5Q6qRAqGDVnLDWydnZIRWf/PdV7OZHmXEarmJrCns+plc230=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761589142; c=relaxed/simple;
	bh=FLrjsXwrLxdTJomTOtBOvXB8xmtsp47Owu22WY93Pi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jS4HMROV3UPbhmONFGfEYWmCDDgimm3TBZyUnV1rK1eMAalYWeKS9s4Ern73HCbjCOQ78O+6dVNlV2+ICmLsdOslBchl4yxJ7LcDrdDxQDoeHb+tiE7t2wl+d7u/l8SK3wklU19eKul/gAnwsFgx3Me0ZoEJe8cacL+mqdPXSUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ayc6GHG/; arc=fail smtp.client-ip=52.101.46.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDsyPYIuDn1P1Z5Z14DxGiLF/Plyomwn8BaS9I5JADrBewFPchMMgU25mBtC02TpeZbE2bIjSo3KTyXj8id3+KLcI9OqzDn1t1yRwxzpQKP4GYji28NH/T20fJVqat9wN9jGehyFysY6BqhNPyBtiV6lBAbLGOq5+2o7rxkeYdbw7PLgvCMmtlPfEF7Z4aqjbLt6EcATAygDrsKlpCymFFtSSnU8IwXEGERsD5z+Uw7QwWPjJvL5gq3Z/R2EJBlHltwxtC8WeY8IQ5/Gjtb9rGrGXvdJaqO1qPxUEOfEKlLvF4/VEnl6DX7OCuOb14rce++j+y1DMlbstmD/bRShDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFHLXd70nrsPY7yLuXcOd5FDpUnhB05Tgf8r8+jcd+I=;
 b=frmZL/WgLzu81X5kVniUZP0hEZJUZy5qNb9xRaQziERSE2oSuVRshyYvVthsS8HShttPnpAEcrtijUV8ZQq4QcE3u/qDToYvxlCZwKsVw6A/tDVxghxJe/RE2RCOZU4K5NoqY208YmYIc1zQaQMDiKw7vQvCMX+yUAjmbJCBy2ejcJk/ChNkOA/V6bjOaMPxhKBYam7N/Z5Ta082/TCYozpUHST70L7WyVWSiyqNQvZcB8dqlkZuveXPKhJgezrqkMwDoepPGJvez7/PuCI52/BZI2HA+MKZxV3UHmN8xCeFMFU4qr7oH31nHK40rjvj3RtXNXf+spINpxUPGJVXng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFHLXd70nrsPY7yLuXcOd5FDpUnhB05Tgf8r8+jcd+I=;
 b=ayc6GHG/5rfhzUWfj9500hU0+5lgvHxsQtq2VzziM06npwfqw2tGoB9cz+LZws1mefuZP157pvKk+L6n5ZJMrj08hhL4/81isGSBpIQ/UPkahslBtckSn8R95zNmXX4Jz+uBU3jlVVxo26fzFS3+o69v7lXAIH8fMTZl3P4Lyi+ZQxompXphYnfPKi6hg7PAvwsvzA/b1jkesYNdmPGDFWwGUWw2qpDGJM06eEqj7IFBAv2vR7b31YOE43Kpyyuh1rmvkzPWpokxQeUrOMop+fcOBQ0FTjfHE9GpnndeXqOdwbQiY+O+Ok7z9K40umNYO2z8uTPzoEchUNvvWXFtgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SA3PR12MB7879.namprd12.prod.outlook.com (2603:10b6:806:306::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Mon, 27 Oct
 2025 18:18:54 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 18:18:54 +0000
Date: Mon, 27 Oct 2025 15:18:53 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	Christian Koenig <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [RFC v2 2/8] dma-buf: Add a helper to match interconnects
 between exporter/importer
Message-ID: <20251027181853.GC1018328@nvidia.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
 <20251027044712.1676175-3-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027044712.1676175-3-vivek.kasireddy@intel.com>
X-ClientProxiedBy: MN2PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:208:23a::20) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SA3PR12MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: c4272521-07ca-415f-f16c-08de15854993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e8a3OdzoCH7chq+Jwr9Yb7SfLWmHLldIZQGiYZx9e/ZY2okCQkiUGXFmNuvO?=
 =?us-ascii?Q?UJah56Us87L8vHnebP+NKj4SpAteHdcZYFnQHaLyUVv3UwdcjzA9OoEDRXRw?=
 =?us-ascii?Q?xI55qlaqI6ZwLPDHEHhiAB0roKIF7ihgauxMAL0SkOanSGF3ENu63IdOaC1n?=
 =?us-ascii?Q?2V0E844pVvTJAxI2IbcEYNc7meDLn9rI6x3sY/hMPYW4P9HMzoxdQeIC/oPz?=
 =?us-ascii?Q?VoTrZYH6u92sisQ/FxMtvVvh7XVBCxxXhoGwdTWdxFWxwsnRY+6CbpNHT8Cp?=
 =?us-ascii?Q?edOW1JXW5ZL7iE7KLlIt7zYZQrLM3xYy093A5t5yP4jR0zm2un7dAE6ioTN7?=
 =?us-ascii?Q?ZoYxAiMca4pN4NFoHGh0dUYKERDzDHu16/a+6lIPkTKiok58rETOJhJrkKEh?=
 =?us-ascii?Q?tilzp+Nj8o2vsnVHbFj3EnD44MQfY5b3c3h+h85/QN4EyQqKRdv6xpxXIVGS?=
 =?us-ascii?Q?4pVWUS9Ikk9w8S8jKSfWgRE1cQB1r0oa36shmfBGJMuGFrdpCcOOfLZ6dYkh?=
 =?us-ascii?Q?IzKwuNq6qEWAqSRlrRzdfjKmHEe/Jk3/wQUl4nysaKU3bdKgFmOWt7U2gk1+?=
 =?us-ascii?Q?rkOcsSDI098DLsoFJ3VIlVxE5WE9grAQClA6+hBRFxyA0opAGMWqjxq9oWa4?=
 =?us-ascii?Q?undfSGkZq6vDas33maMxnMrWZy1jnncEimSXE9ECoeuFuZfepeR1roDvkaIY?=
 =?us-ascii?Q?+CB+hykokt8NNzR0zlbYdCCEuZCLNYnyOhKoo0qWNiG5LIYVuTNFoDt59GSC?=
 =?us-ascii?Q?2GA624dQWWL3lIiI8cGiNh3uWO+OlgX7QrFYXYbXmgMYVK3oKfALG88opn5M?=
 =?us-ascii?Q?DmAI92CRp8yj1i3FHx5T5MGn/AHRNj61OKWGSt0uBWz22YIm8G3J2RHpVZEJ?=
 =?us-ascii?Q?dfMbSo/d4HbD0t0m8Va16+LZ2jyrOT2TAYlIcWhneVAqTPRKgIx++jdWONq2?=
 =?us-ascii?Q?KezfJo6n9fgOQl4huC53iDzCoOFwo2Npd572XyIrkMnCtef9Mw9OV7N6Di6G?=
 =?us-ascii?Q?J3XzqRvRB7C9H7I7l2WKtB/xMBu7co2QzLniHGFb3G+xiNT5VwbmUt+F1hZR?=
 =?us-ascii?Q?zYWF77BiZDeQXlVRCHgE2/qJY+iIKsarG2Y8l7XZJRbs4DsNfKEI/e24qgO2?=
 =?us-ascii?Q?ZoE7lPo3xrBHjTsk566uaphBFcYzD2LECpL4svuWAdp9GzAROMcNfykzl99t?=
 =?us-ascii?Q?LIgDKv+9rowwU5PXKn4Av+l3OW0cM9DgBtzgZ1bMcVd12xr7Dahe+Xh9VX4a?=
 =?us-ascii?Q?RVFQls/IwHo2lVfKco4iNU6N5mJ8GWt2FAKYtDAg5xJLY5gpTJix5JoIo8Ob?=
 =?us-ascii?Q?QsMWxYsL2SQaNAv+2zj8SUFCkD0H+8S3vl1+7nVa+sDjP4SKB+PUbeVDp97a?=
 =?us-ascii?Q?hDcNU2rTm8I7X4e8MPdMY6TL0QaW6JgDgJWzAeeWU+q6SUiEY/dhsrSK0xJv?=
 =?us-ascii?Q?gr83rkNNyitHCXEAiw+ZNFR6NoUzCqqq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FWWeiO4RFa3XIRODRWEqF9ckVukAhuvZlTt5aCTj2cJ/AXE7jkSHZXHk1Uvi?=
 =?us-ascii?Q?nt+lB27qLrbmfNLYv5YXfjMOcmFh7EUffgZg/7b1okRoz5PdEm0d5qgISR54?=
 =?us-ascii?Q?GSOH3ZMtvQKn9DEB7Mdj54gD/rF1Qr7t3D5Uq57kGQ4dG8nqcnbhnYeSu7zl?=
 =?us-ascii?Q?6TU5rC+a45Xto41Xca0VLD2wnLOZsu6ZLpnOag7isCjZWiVu24Iy+XWZ5o5N?=
 =?us-ascii?Q?IuNNMqguBnh3HLizXAdgINr6nJiHJ3PTPcGQH/K1KrCHqYVC7kAG1tmaXRO9?=
 =?us-ascii?Q?5yOHLXFNjYeeL1xkklS2EuEetIBS7WlGjeivfwTGqVrNadwZ+SRiYelmp/dz?=
 =?us-ascii?Q?jB7Bpt5Lge5qpNSSXcxlXZVufR9k4T8v5iJhv6rGouWGXs+WNWVw5JRkYuCC?=
 =?us-ascii?Q?lZ6hVCJni/VeIsbpbdwm12AgcFeyrtzfrxeT39DQxqupskLzKtf7pKoE2SVe?=
 =?us-ascii?Q?66MvOmloXSy2NSoqewzj+bx4KcD2kEa4XQ4Tmfkzti+k1e3+IJUgTvMQgpYn?=
 =?us-ascii?Q?tvx2gtCm+abTy800kBMsxWmx5TUSTeuBJqhcfbJOYfm+uAFLPgQ0Yhxtl8HD?=
 =?us-ascii?Q?5wDllX7hXH3TnqdvaRxnc+rPU0KsFf8/PS9rOPA7sdx5hNnpCyTYDb1hVkn0?=
 =?us-ascii?Q?R+dEc+UJFhF/G7Dubz3IwDYP6FgVZ9uJC4Bx5YcZge3wBZT7JMy2jrm2MKJd?=
 =?us-ascii?Q?WT9APaUBBWbujP3WTLh6N4E7tXvCii7hUeY3Q2qtmq4eiXdoYXzNEsOFFEmX?=
 =?us-ascii?Q?COx2fTcE8SdWSn5LYvuG0Y4r3ebftDUFhdMR0wjjbC4IK6Q7APok36Jbb/KI?=
 =?us-ascii?Q?4081kQthjdq6r2gSkYZR/eRNgqX2W7bOzW5O3Ekog6SIA+ImSS7R/1+hy9v/?=
 =?us-ascii?Q?3cUZUkYAp1FiDz90KoQ/6Vnv70M5C3jnvj2V+Ql1YD6KU3mVSbRyvQVItN+J?=
 =?us-ascii?Q?C3G1ebzQ1TkxdLe+QKa856Yc5Q95AYBn64Usz8I2/qfEESsl00SDxU51w2m6?=
 =?us-ascii?Q?ACoto2bGq4EWIoTQua3qA7fn8P/ABQ54fJgVtWlrHB1ZTvlgnlzI+i7K73Ey?=
 =?us-ascii?Q?gX8Y1exuu+UxiLQGscnlM/qcVASiC53YbwrUSbRCeZJWUgEqLD0SMjEG+jMY?=
 =?us-ascii?Q?6XcbHFHErCbcb1oHucx8IH2lJTqjwx1XNUJpTCwZQsD3B8zS3rKv6PglZx7q?=
 =?us-ascii?Q?TpOcgGwdGCctwqt3GDzcF4WnAweMQU13q2kFF9tUYGMqoQwaYIl4JA4R0ncD?=
 =?us-ascii?Q?lPOS+j9QDYYHQKwNq8jJims9XTMFrTQBz/9dsGAvlRQOY8SgYNYf807D1yEW?=
 =?us-ascii?Q?Pug4R7EGBY66marTDuIQ4ZmrvUwJe3z4AxI7BDQ4N+zMDWXd7YtCVtbX3DaP?=
 =?us-ascii?Q?lQOyndrLph9CLHJlyfVi1lfTQEkd3iC598IdnUd7KtDr2j1DCWMI3PN4/zWt?=
 =?us-ascii?Q?oD0tiacFWcFxML5sA3deSseq70keX1rGsQSrXUvx2Hm6+bJ8nYWsDA8tx4BH?=
 =?us-ascii?Q?4LKkXdTsAEqmD56X5rmmkM8+RrcePc8nN7IlTkV5VKKgdBpNaUD1zjsOxssr?=
 =?us-ascii?Q?J+3lyiRqrUX4D2cfL8U=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4272521-07ca-415f-f16c-08de15854993
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 18:18:54.3521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntfDBWE/VOEmxO0yX5aBuHzqK6PEdX6BEk7hYzoFuve8mSxfPtrRBFvmLM/c5Olk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7879

On Sun, Oct 26, 2025 at 09:44:14PM -0700, Vivek Kasireddy wrote:
> +/**
> + * dma_buf_match_interconnects - determine if there is a specific interconnect
> + * that is supported by both exporter and importer.
> + * @attach:	[in]	attachment to populate ic_match field
> + * @exp:	[in]	array of interconnects supported by exporter
> + * @exp_ics:	[in]	number of interconnects supported by exporter
> + * @imp:	[in]	array of interconnects supported by importer
> + * @imp_ics:	[in]	number of interconnects supported by importer
> + *
> + * This helper function iterates through the list interconnects supported by
> + * both exporter and importer to find a match. A successful match means that
> + * a common interconnect type is supported by both parties and the exporter's
> + * match_interconnect() callback also confirms that the importer is compatible
> + * with the exporter for that interconnect type.

Document which of the exporter/importer is supposed to call this

> + *
> + * If a match is found, the attach->ic_match field is populated with a copy
> + * of the exporter's match data.

> + * Return: true if a match is found, false otherwise.
> + */
> +bool dma_buf_match_interconnects(struct dma_buf_attachment *attach,
> +				 const struct dma_buf_interconnect_match *exp,
> +				 unsigned int exp_ics,
> +				 const struct dma_buf_interconnect_match *imp,
> +				 unsigned int imp_ics)
> +{
> +	const struct dma_buf_interconnect_ops *ic_ops;
> +	struct dma_buf_interconnect_match *ic_match;
> +	struct dma_buf *dmabuf = attach->dmabuf;
> +	unsigned int i, j;
> +
> +	if (!exp || !imp)
> +		return false;
> +
> +	if (!attach->allow_ic)
> +		return false;

Seems redundant with this check for ic_ops == NULL:

> +	ic_ops = dmabuf->ops->interconnect_ops;
> +	if (!ic_ops || !ic_ops->match_interconnect)
> +		return false;

This seems like too much of a maze to me..

I think you should structure it like this. First declare an interconnect:

struct dma_buf_interconnect iov_interconnect {
   .name = "IOV interconnect",
   .match =..
}

Then the exporters "subclass"

struct dma_buf_interconnect_ops vfio_iov_interconnect {
    .interconnect = &iov_interconnect,
    .map = vfio_map,
}

I guess no container_of technique..

Then in VFIO's attach trigger the new code:

   const struct dma_buf_interconnect_match vfio_exp_ics[] = {
        {&vfio_iov_interconnect},
    };

   dma_buf_match_interconnects(attach, &vfio_exp_ics))

Which will callback to the importer:

static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
   .get_importer_interconnects
}

dma_buf_match_interconnects() would call
aops->get_importer_interconnects
and matchs first on .interconnect, then call the interconnect->match
function with exp/inpt match structs if not NULL.

> +struct dma_buf_interconnect_match {
> +	const struct dma_buf_interconnect *type;
> +	struct device *dev;
> +	unsigned int bar;
> +};

This should be more general, dev and bar are unique to the iov
importer. Maybe just simple:

struct dma_buf_interconnect_match {
    struct dma_buf_interconnect *ic; // no need for type
    const struct dma_buf_interconnct_ops *exporter_ic_ops;
    u64 match_data[2]; // dev and bar are IOV specific, generalize
};

Then some helper

       const struct dma_buf_interconnect_match supports_ics[] = {
          IOV_INTERCONNECT(&vfio_iov_interconnect, dev, bar),
       }

And it would be nice if interconnect aware drivers could more easially
interwork with non-interconnect importers.

So I'd add a exporter type of 'p2p dma mapped scatterlist' that just
matches the legacy importer.

Jason

