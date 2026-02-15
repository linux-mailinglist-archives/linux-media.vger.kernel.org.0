Return-Path: <linux-media+bounces-52820-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO+wFMykkWmBlAEAu9opvQ
	(envelope-from <linux-media+bounces-52820-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 11:49:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D431313E829
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 11:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F10B63002338
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 10:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E26B2C3254;
	Sun, 15 Feb 2026 10:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JBNR7ftr"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011014.outbound.protection.outlook.com [40.93.194.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4518F29E0F6
	for <linux-media@vger.kernel.org>; Sun, 15 Feb 2026 10:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771152581; cv=fail; b=qBTEpc6ijdkHF5ql4bagHgWr806WaAP9zM9UKvCR6/oFaeD583VjWZrEyRv8SfE8VyahzU5SR4/eaAssW+VbZGUXzsESCI9337oDPB/2WunB4JoluK4dAUghuoNj09hLSYGf1RNltUS4FMU6NlY1kEbrIvfe6wonAA68PY56zpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771152581; c=relaxed/simple;
	bh=p1I+kf1i+e0hgsv623ugXZq7pPBbP1o6QW7Ubs/9mv0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rmCNrcOxtM0qTCQ3whk43AypFFIV5rccDbj6h79FxIVlSq9M3VUAuhl/dMjwtKIGBL1xqQ9EpMgf6cTGrCaLeLpnWV7JY26qkbIrvvo1/irmdovgSaPqX9iAElxL6bO69mWAsLHHPdGttSZKY/DVNCj0bpYqEPhiAx6lTuh3Tgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JBNR7ftr; arc=fail smtp.client-ip=40.93.194.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1lbj5S7GshRnwmZZ2lb1tL9nMZ8rTTC5jB5rpurehsx/biBSv9xvu9SWfb7EybEOZcgHFbcwscFQLLAPnZe2UxyYX7lAMviXPCgXZjtmtyy7JdCvY3Cguc2rs/EhPCjFCl+HcttP9MQ/sntZBjfab75C6LXYycFeEno60nERD+s7MMTJDHVUbaNZpfoB/v/RKztgpXZE1jaYeSw31l5VPmXO5WTgshVLpxC7LsLNFQOBp55dDKFpe60Kv5urrhxG81fSOq315BWYmRB5pP2jXdApP8CWvK4ENCmg+IZ1j6SN4t+47SfQ1uN8FXMvezlBTFGIvBz9gIvE41FT7sMTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7mwQP+NrDxJQcHILTPsr5fSoMZigTCGfQiAVTL87zY=;
 b=g/zurSqvu4pvuYpypQ9xF3wdsgoCeFz7XTA8DcVJ5wJIuIcsAqc8vEs6Jz/dWwTmoC29lRG8KnD1nOxGbFP9kmFQCtJ74DitOzuzne1vvL7AAReOekQqkN2ZjHRTi5Jlnr+XIonXOkYflkZlGl2egcwf75DK0koVYxdG50HCF53dne+rQNIWZJyi2I7+vrI6+X+FUN3hbFdOxT8eCMh1b/EtfxbLaCrZHwXQlFv8RgNYzfMHfd4+Nl0uSRpXpz52qfH6b2lldS1WJAPT5PgfI4jrEpwnCoMepszXzywd0cFDvzYDxnmYEZqYqtZ4+rFmdblKDzuaYmTfAyydpkBTwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7mwQP+NrDxJQcHILTPsr5fSoMZigTCGfQiAVTL87zY=;
 b=JBNR7ftrlI7RofLDwOTTnBpfJ0sHYaCTgicO95dXeKIWE91/TjM7HvGyhlCAIsXuIe6YTEHjjGM3iJUyMP38lfdPURmVAFZAP+kxcLK66qkiWcApaav5PLxgX6FnEvSnWTucyjzLYk9d0LWw4opzY5ZpBOM+ADCoGzTFb6kY52sOfdSI3afVVKI0cnHCuWFK6J2HcJM3kCdieWdbAnDAGxfdtT6xOu3xQAYPZ3tgmDGXr+gb+EmPlJj8GeaER4BPl5bpOICksCse1bb7ST/lB04+xKHT5GMf+PPDhPly/LLBJTnLxwoON9aMc7M683X4VgbcDagO3OpFSj2AAPDDCA==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by LV8PR12MB9135.namprd12.prod.outlook.com (2603:10b6:408:18c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Sun, 15 Feb
 2026 10:49:23 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%6]) with mapi id 15.20.9611.012; Sun, 15 Feb 2026
 10:49:22 +0000
From: Parav Pandit <parav@nvidia.com>
To: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: Albert Esteve <aesteve@redhat.com>, =?iso-8859-1?Q?Alex_Benn=E9e?=
	<alex.bennee@linaro.org>, Cornelia Huck <cohuck@redhat.com>, Daniel Almeida
	<daniel.almeida@collabora.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Enric Balletbo i Serra
	<eballetb@redhat.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Peter Griffin <peter.griffin@linaro.org>, Demi Marie
 Obenour <demiobenour@gmail.com>, Manos Pitsidianakis
	<manos.pitsidianakis@linaro.org>, Matias Ezequiel Vara Larsen
	<mvaralar@redhat.com>, Trilok Soni <tsoni@quicinc.com>, Matti Moell
	<matti@qti.qualcomm.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
Subject: RE: [PATCH v10 1/1] virtio-video: Add virtio video device
 specification
Thread-Topic: [PATCH v10 1/1] virtio-video: Add virtio video device
 specification
Thread-Index: AQHcnMY9mdfcscxHdkq+IiE/Iv9iYbWDlVSA
Date: Sun, 15 Feb 2026 10:49:22 +0000
Message-ID:
 <SJ0PR12MB680603C30AB26E93ECB27E2FDC6FA@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <20260213085306.313348-1-alexander.gordeev@oss.qualcomm.com>
 <20260213085306.313348-2-alexander.gordeev@oss.qualcomm.com>
In-Reply-To: <20260213085306.313348-2-alexander.gordeev@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|LV8PR12MB9135:EE_
x-ms-office365-filtering-correlation-id: 28559429-3231-4a12-eaa5-08de6c7fe10a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021|13003099007;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?gCt4Xc9rRmg/x6f3Fzb2mawX5m6XATRWn4nREyQ6VOR+v9ZbPccHzlJyPn?=
 =?iso-8859-1?Q?6MEcRISKtbpN3ZC3UoUZwc1eB5fWKkjWBGoMvutdbth1rQ8vy2NlHH72lu?=
 =?iso-8859-1?Q?r9dPz4VUwZT5TSheU5huIsrFsmjZbRjxTt1vUnL5ZU5oaFxRwplgog5x0H?=
 =?iso-8859-1?Q?ooWImDWcAEc04BmKSg3smZpl7nr/OfBTtfew8yUBMAhdEijTCZoV6pRUwG?=
 =?iso-8859-1?Q?+8BYnckP9uMwpry0cYvw1rnLQ4E3HEl/VJSqV3BPNVMtSVCZ+ogVKw+Coi?=
 =?iso-8859-1?Q?ry09J8diNTpS8FpuTWrg4VllLDw12/pe0WNWI/87QNNX8dezSHbHhQdSqp?=
 =?iso-8859-1?Q?rMOwvq+Pd1yuu17sODyn/czNCOSbMVG6bLKx1Eq0TgsoaE5V0t6JZJnp8v?=
 =?iso-8859-1?Q?6mV1bz44w6M74r0fMo49TvYHCyWHGtvE+y5i9P1Z/HefmKDFmN5ILwYkxE?=
 =?iso-8859-1?Q?rmYuy90gS4Mw7205/IKjCF69dks8g+tWiyiNgzhyAyNpkYRG6HY5d5vHha?=
 =?iso-8859-1?Q?cY5/rNXzR2O+JWrqJl/gsjRA8xmyR5kEV4InFSaeTUtvZ7u6ZSrbLUJq4e?=
 =?iso-8859-1?Q?cz+GMaTq5SwYIcZwlujRE7VbYqMGolAFENJ77ygjD1Pq8V7uXhl6S3GILU?=
 =?iso-8859-1?Q?mrjNshNgRpMbiYR7NIkCyMIvNeyqMoaF20oQZJ8cDZTHqyk6UEx81HaQok?=
 =?iso-8859-1?Q?3J2DVC3XYlU9tCt0OXy6lNT7CInHSVW9eT0AdnY3qqFHsrQL7MoSB4a/AN?=
 =?iso-8859-1?Q?zCJ//ZceR/q+rkHzkz56yfQo0M3Tlx+sI3iffmO2BmakzLkZXgpgT5wI0S?=
 =?iso-8859-1?Q?c6Ud5vTSS4Qm3ZvogPrNiPYjCYTFSTWBvxJ84mgfKsF8m6DfKUlRZiJt7I?=
 =?iso-8859-1?Q?2DS57bCH3CkoIOW7ZJF+tLJUB4gZ447hni3GEgttSsQgVvSvW2I1lNCMac?=
 =?iso-8859-1?Q?BTWlD5feLFmOy7ioI4DAp+lrrr0rCyvWtplpUwOJlJG/xltZpyeb/UDU+o?=
 =?iso-8859-1?Q?1yCU9fPL0Vkg40Fe0FVzGytdYI0DhTW0i4sw31n8ZDMvg1/+NoMv2F5UcL?=
 =?iso-8859-1?Q?+33G9St1S+7AAGi7FB9WxpVgU7YyrjKu1XC/ZLss1R1SCRZve2QmrVYTYB?=
 =?iso-8859-1?Q?5LOWDzsdZIlSYFAJw0ZtZnJZ+SU/2XWEYrBC7JZ44ia30FpRgsUFNUUdfU?=
 =?iso-8859-1?Q?PQHaepfLpnOONB79hNRjOzKs6RQMpRVImi5IXuYBxEvJZ4gmZLz3mcBJxZ?=
 =?iso-8859-1?Q?5zSp2tt+o0KuO/yoNCvM1TrMrCp4PgdDv/6i6Y4jbxDpcNnS/MAlEj9yQD?=
 =?iso-8859-1?Q?0upmDaSnOHC2TkYz3qN0022jXqGV+qLLTun+uzS24CqRw2HZK4QvGmmmBp?=
 =?iso-8859-1?Q?UO11GkdHcmbKdSIWCUboBLp5Rcy6RV2nYbUWr5d7K60cj28tLoMFUOrf+h?=
 =?iso-8859-1?Q?hiyc2kevCoIFYmG8q2pkNBCqfOuTY/1TMMa80t/LqtG9dItGZSH8dPxsdI?=
 =?iso-8859-1?Q?a0GHkA41yMcdU6yMMADRIm7YBKUKoqmq3kMcy2S30fwPR4NNTuVstqFfiM?=
 =?iso-8859-1?Q?umBSngw+fVQpDBTJmx38yBFcoF4iJPMQj4PCIEkU1OiEzOMEAeIdBEk5tb?=
 =?iso-8859-1?Q?UnRqWXYpmjMkXuGylfHO9qwDqMdcoFjB5wx2wg3z6EjOzZNorMhSWFBUbq?=
 =?iso-8859-1?Q?AfH0aQbfO8skP1mtx3w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gCJbIS//+3ruUtOlPJFwewJ7U4uBbXJP0jWJOBjEtLwM+20cYEBqSCpJQB?=
 =?iso-8859-1?Q?LzH3wjcWtkItGM51eyuQ+wI8bY43o2ujwxz8lDbTgmWESlO+/3tKpPcra2?=
 =?iso-8859-1?Q?nQDqksTRHJctbdMLs3vffCEtydt8jKzEf+maQSm3h2SPDQCPSFONmn0sr1?=
 =?iso-8859-1?Q?P15aApaAn8HF5gXqoKYts31/PTVHSuXXL95e8UV4nnmVzZ7n0a3lvDB6h1?=
 =?iso-8859-1?Q?yoZUILatCjkB2IJe82Mo1cxq+Lukw1Of2fomrEbsTYDDUWAuYQO+lGOu95?=
 =?iso-8859-1?Q?caYYIqS5qFRvHmNXiNOTdUWMp7/QxU4K3sYoiw861S3ezWom0T/JixWVkk?=
 =?iso-8859-1?Q?291PI4cN4J9ld23esHAlw2J3XTODPpAk0yqHPmEa9cXMglDsPmy5hMF5PA?=
 =?iso-8859-1?Q?naUhcv8sYiBq/drOHDSKK7P36B/BfOQCw2dRy8XBoltv7gXWgYR42QDLWu?=
 =?iso-8859-1?Q?Na8vsnNCdDK/UNftxe7bcKMM7j0GZqsaxdxPxmFt1s0lCuxKHg3s88jLKd?=
 =?iso-8859-1?Q?4OqGgL9nxerTU6g8J273so54OQP9cEPA27w8L/oapE4zuEmd8HMEzY3sih?=
 =?iso-8859-1?Q?qpxNmwHnKWKFigqZFAtYzbYbP0KxQ3Ytgx7+l9jSN4elbaE+Zl6JLAidDo?=
 =?iso-8859-1?Q?RZDoLppVNYKuQmNzgEhXLEjEddLVFxxMwjwTxAATYpKjSTO0fCKdbzJcVj?=
 =?iso-8859-1?Q?a62BLYLYsMxOr2Fv9iG7b1oiDxEuKx0RcObVec6rlSBWq5TdLgGIBLw15o?=
 =?iso-8859-1?Q?9rphSr9w1gxHO50rnjZ7GDAJHEdknfFOBAlU373DOmdIV5y+AcvyZUeU6v?=
 =?iso-8859-1?Q?T3LsyO6TtidqE78s3pxNruyMdd9JI8BhkfCzQWtUktXG6NmUniTchktMYo?=
 =?iso-8859-1?Q?j1sxVNNbA/NDau0tIytD5+pz7b4Ab7l060z+HUIV+Aaqv6W5MOPQ26DyvA?=
 =?iso-8859-1?Q?ozjuUcBvl+81XWnXG9WIq8/ACs2XogBqs4Vtcqh5RxzC2vlybjFh99+YSr?=
 =?iso-8859-1?Q?relwRop/eydrR9/Wsxj1491HgldLW5h8/bR0UsAycDeeZEvLUUbnHJ8XQB?=
 =?iso-8859-1?Q?W8Pw+7GTrGJQOIjR98+fo9oxTEQ0miW2QkdtpWlPIv/wIoa0hfa6lDqUEr?=
 =?iso-8859-1?Q?gcdB2B7uLLGPL9keF9OUvHMOZvQtthxzJIb0nHBHHl9BH0isPL888Svmle?=
 =?iso-8859-1?Q?V4tB9x4JetgGkcnlqpxvRLwsJyEUNsA+dpyFX3RJgyh2m2xqUB8FsP45mO?=
 =?iso-8859-1?Q?7h3howv/jH9cOj0+KKn+WV4DPBDEYQttCS1/iDYNVK5HlDg9zHrDSdFRID?=
 =?iso-8859-1?Q?l0MxUmIQbHhccI8t9WU9u5uPjf/OirapgUoPgUWusAxookeAtyhwyF+Ate?=
 =?iso-8859-1?Q?0e7KQQpc5CO5iZebWjtef8ttt4s+03u8OngJH52BzKLnRZs+nP390rCzOk?=
 =?iso-8859-1?Q?KsdEIHgHoaSm0M4Kk5isa5Dn23pnZNVcAmyS/mwkLOEgqW1zzm6c/uCiXk?=
 =?iso-8859-1?Q?OtSN6X+wDkvO73IGsBUVW8pSL3tfrVkZ3yZknEqNz7iHIkkx5SU3BbK7WD?=
 =?iso-8859-1?Q?NH3nf9PgtHolxDefmV3gmvkeHIvWA3PzQ4DWO4nvJObIgkviMfwMKZNymO?=
 =?iso-8859-1?Q?q9UlXJ68xqedpobKf+vJ91TYv4wjWapnnz0gN7bgSm/gWTCXISbrsN9Qhn?=
 =?iso-8859-1?Q?gQ5rzU/3eAqSexyJ2vCQWjIAY+PDrDHDGRPlFQv7xmHVSob7lB7532Vyv8?=
 =?iso-8859-1?Q?8pBlSp6Rm3+ZfD9pD7rfao6TXDnFEixH3E0MkopU9aGPf9?=
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
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28559429-3231-4a12-eaa5-08de6c7fe10a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2026 10:49:22.5375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6kOyx1MCayTwg5cPrZebPlHoPFrPLz9uyneGXjwIVKsFUkGMQIewO86Rc/i+XSlYDUCpKIMGchmtNGdrUqgDWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9135
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52820-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[redhat.com,linaro.org,collabora.com,ideasonboard.com,gmail.com,quicinc.com,qti.qualcomm.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[parav@nvidia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,Nvidia.com:dkim,secg.org:url,ozlabs.org:url,qualcomm.com:email]
X-Rspamd-Queue-Id: D431313E829
X-Rspamd-Action: no action


> From: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
> Sent: 13 February 2026 02:23 PM
>=20
> From: Alexander Gordeev <Alexander.Gordeev@opensynergy.com>
>=20
> Add the specification of the video decoder and encoder device, which
> can be used to provide host-accelerated video operations to the guest.
>=20
> Signed-off-by: Alexander Gordeev <alexander.gordeev@opensynergy.com>
> ---
>  conformance.tex                           |   12 +-
>  content.tex                               |    1 +
>  device-types/video/description.tex        | 1592 +++++++++++++++++++++
>  device-types/video/device-conformance.tex |   22 +
>  device-types/video/driver-conformance.tex |   20 +
>  introduction.tex                          |   21 +
>  6 files changed, 1664 insertions(+), 4 deletions(-)
>  create mode 100644 device-types/video/description.tex
>  create mode 100644 device-types/video/device-conformance.tex
>  create mode 100644 device-types/video/driver-conformance.tex
>=20
> diff --git a/conformance.tex b/conformance.tex
> index 9af31e2..f34e600 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -37,8 +37,9 @@ \section{Conformance Targets}\label{sec:Conformance / C=
onformance Targets}
>  \ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance},
>  \ref{sec:Conformance / Driver Conformance / CAN Driver Conformance},
>  \ref{sec:Conformance / Driver Conformance / SPI Controller Driver Confor=
mance},
> -\ref{sec:Conformance / Driver Conformance / Media Driver Conformance} or
> -\ref{sec:Conformance / Driver Conformance / RTC Driver Conformance}.
> +\ref{sec:Conformance / Driver Conformance / Media Driver Conformance},
> +\ref{sec:Conformance / Driver Conformance / RTC Driver Conformance} or
> +\ref{sec:Conformance / Driver Conformance / Video Driver Conformance}.
>=20
>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional D=
evice and Transitional Driver Conformance}.
>    \end{itemize}
> @@ -68,8 +69,9 @@ \section{Conformance Targets}\label{sec:Conformance / C=
onformance Targets}
>  \ref{sec:Conformance / Device Conformance / PMEM Device Conformance},
>  \ref{sec:Conformance / Device Conformance / CAN Device Conformance},
>  \ref{sec:Conformance / Device Conformance / SPI Controller Device Confor=
mance},
> -\ref{sec:Conformance / Device Conformance / Media Device Conformance} or
> -\ref{sec:Conformance / Device Conformance / RTC Device Conformance}.
> +\ref{sec:Conformance / Device Conformance / Media Device Conformance},
> +\ref{sec:Conformance / Device Conformance / RTC Device Conformance} or
> +\ref{sec:Conformance / Device Conformance / Video Device Conformance}.
>=20
>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional D=
evice and Transitional Driver Conformance}.
>    \end{itemize}
> @@ -170,6 +172,7 @@ \section{Conformance Targets}\label{sec:Conformance /=
 Conformance Targets}
>  \input{device-types/spi/driver-conformance.tex}
>  \input{device-types/media/driver-conformance.tex}
>  \input{device-types/rtc/driver-conformance.tex}
> +\input{device-types/video/driver-conformance.tex}
>=20
>  \conformance{\section}{Device Conformance}\label{sec:Conformance / Devic=
e Conformance}
>=20
> @@ -264,6 +267,7 @@ \section{Conformance Targets}\label{sec:Conformance /=
 Conformance Targets}
>  \input{device-types/spi/device-conformance.tex}
>  \input{device-types/media/device-conformance.tex}
>  \input{device-types/rtc/device-conformance.tex}
> +\input{device-types/video/device-conformance.tex}
>=20
>  \conformance{\section}{Legacy Interface: Transitional Device and Transit=
ional Driver Conformance}\label{sec:Conformance / Legacy
> Interface: Transitional Device and Transitional Driver Conformance}
>  A conformant implementation MUST be either transitional or
> diff --git a/content.tex b/content.tex
> index 5de811f..0c13f68 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -835,6 +835,7 @@ \chapter{Device Types}\label{sec:Device Types}
>  \input{device-types/spi/description.tex}
>  \input{device-types/media/description.tex}
>  \input{device-types/rtc/description.tex}
> +\input{device-types/video/description.tex}
>=20
>  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>=20
> diff --git a/device-types/video/description.tex b/device-types/video/desc=
ription.tex
> new file mode 100644
> index 0000000..8945e26
> --- /dev/null
> +++ b/device-types/video/description.tex
> @@ -0,0 +1,1592 @@
> +\section{Video Device}
> +\label{sec:Device Types / Video Device}
> +
> +The virtio video device provides support for host-accelerated video enco=
ding
> +and decoding.
> +
> +\subsection{Device ID}
> +\label{sec:Device Types / Video Device / Device ID}
> +
> +50
> +
> +\subsection{Virtqueues}
> +\label{sec:Device Types / Video Device / Virtqueues}
> +
> +\begin{description}
> +      \item[0]
> +            commandq - driver commands
> +      \item[1]
> +            eventq - device async responses to commands and standalone d=
evice events
> +\end{description}
> +
> +\subsection{Feature bits}
> +\label{sec:Device Types / Video Device / Feature bits}
> +
> +\begin{description}
> +      \item[VIRTIO_VIDEO_F_ENCODER (0)]
> +            The device can encode video.
> +      \item[VIRTIO_VIDEO_F_DECODER (1)]
> +            The device can decode video.
> +            % Use-case: the device can support both encoding and decodin=
g, so having both
> +            % here can save resources.
> +      \item[VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES (2)]
> +            Guest pages can be used as the backing memory of resources.
> +      \item[VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG (3)]
> +            The device can use non-contiguous guest memory as the backin=
g memory of
> +            resources. Only meaningful if VIRTIO_VIDEO_F_RESOURCE_GUEST_=
PAGES is also
> +            set.
> +      \item[VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT (4)]
> +            Objects exported by another virtio device can be used as the=
 backing memory
> +            of resources.
> +      \item[VIRTIO_VIDEO_F_V4L2_COMPATIBLE_LAST_BUFFER (5)]
> +            The device releases an extra empty output buffer after a dra=
in or DPC so that
> +            the driver can send a buffer with V4L2_BUF_FLAG_LAST set in =
the V4L2 way.
This does not seem relavant to the video device.
It should not be attached to any V4L2 implementation.
Can you please craft it differently?

> +\end{description}
> +
> +\devicenormative{\subsubsection}{Feature bits}{Device Types / Video Devi=
ce / Feature bits}
> +
> +The device MUST set at least one of VIRTIO_VIDEO_F_ENCODER or VIRTIO_VID=
EO_F_DECODER.
> +
> +The device MUST set at least one of VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES =
or
> +VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT, since the absence of both bits wo=
uld
> +mean that no memory can be used at all for resources.
> +
> +The device MUST NOT set VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG unless it als=
o sets
> +VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES.
> +
> +\drivernormative{\subsubsection}{Feature bits}{Device Types / Video Devi=
ce / Feature bits}
> +
> +The driver MUST negotiate at least one of the VIRTIO_VIDEO_F_ENCODER and
> +VIRTIO_VIDEO_F_DECODER features.
> +
> +The driver MUST negotiate at least one of the
> +VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES and VIRTIO_VIDEO_F_RESOURCE_VIRTIO_O=
BJECT
> +features.
> +
You wouldn't need virtio_object feature bit. It should be covered using the=
 capability.

> +If VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES has been negotiated, but not
> +VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG, the driver MUST use physically
> +contiguous memory for all the buffers it allocates.
> +
> +\subsection{Device configuration layout}
> +\label{sec:Device Types / Video Device / Device configuration layout}
> +
> +The video device configuration space uses the following layout:
> +
> +\begin{lstlisting}
> +struct virtio_video_config {
> +        le32 max_streams;
> +        le32 caps_length;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{max_streams}]
> +            is the maximum number of concurrent streams the device suppo=
rts.
> +      \item[\field{caps_length}]
> +            is the minimum length in bytes that a device-writable buffer=
 must have
> +            in order to receive the response to VIRTIO_VIDEO_CMD_DEVICE_=
QUERY_CAPS, see
> +            \ref{sec:Device Types / Video Device / Device Operation / De=
vice Operation: Device Commands / QUERY CAPS}.
> +\end{description}
> +
> +\devicenormative{\subsubsection}{Device configuration layout}{Device Typ=
es / Video Device / Device configuration layout}
> +
> +\field{max_streams} MUST be positive.
> +
> +\field{caps_length} MUST be set to the response size of
> +VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS.
> +
This plumbing can be easily done using 'Device and driver capabilities' loc=
ated in the 'Group administration commands'.
Please rework the patch to use the existing basic facility.
This can also possibly eliminate plumbing device specific command q.
More below.

> +\subsection{Device Initialization}
> +\label{sec:Device Types / Video Device / Device Initialization}
> +\begin{enumerate}
> +      \item
> +            The driver reads the feature bits and negotiates the feature=
s it needs.
> +      \item
> +            The driver sets up the commandq and the eventq.
> +      \item
> +            The driver reads the \field{caps_length} field of the config=
uration
> +            space, prepares a buffer of at least that size and sends the=
 buffer on the
> +            commandq with the VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS command=
.
> +      \item
> +            The device sends a response over commandq to
> +            VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS via used descriptors prov=
ided with the
> +            command.
> +      \item
> +            The driver receives the response from the device, and parses=
 its capabilities.
> +\end{enumerate}
> +
> +\subsection{Device Operation}
> +\label{sec:Device Types / Video Device / Device Operation}
> +
> +The device supports opening and operating a number of parallel streams u=
p to
> +\field{max_streams}. Each stream has three internal device queues: mainq=
X,
> +inputqX and outputqX, where X is the stream id. Each stream command has =
a
> +field that dispatches the command to the specific internal queue.
> +
If these queues are internal to the device it does not need exposure in the=
 spec here. If they have a meaning to the driver,
Than keyword 'internal' should be dropped and rephased.

> +% Use-case: there might be different real-time requirements for differen=
t
> +% streams, so more virtqueues can be added in the future if necessary.
> +% The internal queues don't change, the data formats don't change, only =
the
> +% mapping of streams/internal queues to particular virtqueues changes.
> +
> +The mainqX is used to open a stream with VIRTIO_VIDEO_CMD_STREAM_OPEN,
> +close a stream with VIRTIO_VIDEO_CMD_STREAM_CLOSE, reset inputqX or outp=
utqX
> +using VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET, set some of the stream parame=
ters out
> +of band with high priority with VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS, unbl=
ock
> +the outputqX with VIRTIO_VIDEO_CMD_STREAM_UNBLOCK if it gets blocked for
> +format negotiation.
> +
> +The inputqX and outputqX are used to queue input or output resources usi=
ng
> +VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE. Additionally inputqX is used to =
set input and
> +output parameters using VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS, to complete
> +processing of all queued input resources and make the resulting output
> +resources available to the driver using VIRTIO_VIDEO_CMD_STREAM_DRAIN.
> +
> +All the stream commands start async operations, return the results
> +using async responses over eventq.
> +The eventq is used by the device to send the device's async responses to
> +stream commands and the device's standalone events.
> +
> +% This way eventq becomes the single source of truth about the device's =
state,
> +% the driver doesn't have to tediously synchronize commandq's and eventq=
's
> +% used queues the way it was necessary in the past (similarly to V4L2's =
DQBUF
> +% and DQEVENT). One more benefit is that commandq is processed fast and
> +% strictly in order, so commandq descriptors exhaustion should never hap=
pen in
> +% practice.
> +
Video device should be implementable without any V4L2 binding/description e=
tc.

> +Parameters allow the driver to configure the stream including setting up=
 the
> +resources. Available parameters depend on the device type, see
> +\ref{sec:Device Types / Video Device / Device capabilities and parameter=
s}.
> +
> +A resource is a set of memory buffers that contain a unit of data that
> +the device can process or produce. Most resources have only one buffer,
> +raw frames using a multi-planar format can have several.
> +Input resources are filled by the driver with compressed (coded) video d=
ata
> +for a decoder and raw frames for an encoder, output resources are filled=
 by
> +the device as the result of processing the input resources with decoded =
raw
> +frames for a decoder and compressed (encoded) data for an encoder.
> +Resources from inputqX and outputqX are consumed independently, not in p=
airs.
> +One input resource can result in zero to many produced output resources.
> +A decoder device dequeues the output decoded frames in presentation orde=
r.
> +An encoder device dequeues the output decoded frames in decoding order.
> +The driver can reuse a queued resource after receiving a corresponding a=
sync
> +response. Dequeued output resources can still be used by the device as
> +reference frames, so the driver can't write to them.
> +
> +% TODO: maybe send the second RESOURCE_QUEUE async response, when the de=
queued
> +% output resource is not used by the device anymore and therefore become=
s
> +% writeable?
> +
> +The device can detect standalone stream-related events: errors and dynam=
ic
> +parameters changes that require intervention from the driver (e.g.
> +reallocating backing memory of output resources to fit the new parameter=
s).
> +The events are signalled on the eventq, see
> +\ref{sec:Device Types / Video Device / Device Operation / Device Operati=
on: Standalone Events}.
> +
> +\devicenormative{\subsubsection}{Device Operation}{Device Types / Video =
Device / Device Operation}
> +
> +The device MUST set to zero all unused, disabled or padding bits in its
> +responses.
> +
> +\subsubsection{Device Operation: Command Virtqueue}
> +\label{sec:Device Types / Video Device / Device Operation / Device Opera=
tion: Command Virtqueue}
> +
> +This section lists the commands that can be sent by the driver to comman=
dq.
> +
> +Different structures are used for each command and response. A command
> +structure starts with the requested command code, defined as follows:
> +
> +\begin{lstlisting}
> +/* Device */
> +#define VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS      0x100
> +
> +/* Stream */
> +#define VIRTIO_VIDEO_CMD_STREAM_OPEN            0x200
> +#define VIRTIO_VIDEO_CMD_STREAM_CLOSE           0x201
You can craft the stream using a existing basic facility of resource object=
.
Where each stream is just a resource object, that be queried or modified.

> +#define VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS      0x202
> +#define VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS      0x203
> +#define VIRTIO_VIDEO_CMD_STREAM_UNBLOCK         0x204
> +#define VIRTIO_VIDEO_CMD_STREAM_DRAIN           0x205
> +#define VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET     0x206
> +#define VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE  0x207
> +\end{lstlisting}
> +
> +Stream commands start with a header:
> +
> +\begin{lstlisting}
> +#define VIRTIO_VIDEO_QUEUE_TYPE_MAIN    0
> +#define VIRTIO_VIDEO_QUEUE_TYPE_INPUT   1
> +#define VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT  2
> +
> +struct virtio_video_stream_cmd_header {
> +        le32 type; /* One of VIRTIO_VIDEO_CMD_STREAM_* */
> +        le32 stream_id;
> +        le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* */
> +        le32 async_response_cookie;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{async_response_cookie}]
> +            is an async response cookie provided by the driver, that all=
ows
> +            to relate an async response to the previously submitted comm=
and.
> +\end{description}
> +
> +\subsubsection{Device Operation: Event Virtqueue}
> +\label{sec:Device Types / Video Device / Device Operation / Device Opera=
tion: Event Virtqueue}
> +
> +The eventq is used by the device to send async responses to commands que=
ued
> +by the driver on commandq and standalone events. Stream errors and dynam=
ic
> +parameters changes are caused by changes in the device's state, not by
> +commands, still they are delivered as responses to implicit
> +VIRTIO_VIDEO_CMD_STREAM_CLOSE and VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS,
> +respectively.
> +
> +Events start with a header:
> +
> +\begin{lstlisting}
> +#define VIRTIO_VIDEO_EVENT_FLAG_ERROR              (1 << 0)
> +#define VIRTIO_VIDEO_EVENT_FLAG_STANDALONE         (1 << 1)
> +#define VIRTIO_VIDEO_EVENT_FLAG_CANCELED           (1 << 2)
> +#define VIRTIO_VIDEO_EVENT_FLAG_BLOCKED            (1 << 3)
> +
> +struct virtio_video_event_header {
> +        le32 event_type; /* VIRTIO_VIDEO_CMD_STREAM_* */
> +        le32 stream_id;
> +        le32 async_response_cookie;
> +        le32 event_flags; /* Bitmask of VIRTIO_VIDEO_EVENT_FLAG_* */
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{event_type}]
> +            is the type of the event.
> +      \item[\field{stream_id}]
> +            is the ID of a valid stream.
> +      \item[\field{async_response_cookie}]
> +            is an async response cookie provided by the driver, that all=
ows
> +            to relate the event to a previously submitted command.
> +      \item[\field{event_flags}]
> +            is a bitmask of VIRTIO_VIDEO_EVENT_FLAG_* flags
> +
> +            \begin{description}
> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_ERROR]
> +                        is set if the command finished with an error due=
 to an
> +                        invalid argument or for other reasons.
> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_STANDALONE]
> +                        is set for standalone events, see
> +                        \ref{sec:Device Types / Video Device / Device Op=
eration / Device Operation: Standalone Events}.
> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_CANCELED]
> +                        is set if the command has been canceled by anoth=
er
> +                        command, that has higher priority. Doesn't make =
sense
> +                        for standalone events.
> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_BLOCKED]
> +                        is set if the command triggered a block on the
> +                        outputqX to allow output format negotiation.
> +                        When the negotiation is finished the block has t=
o be
> +                        removed using VIRTIO_VIDEO_CMD_STREAM_UNBLOCK
> +                        command, see
> +                        \ref{sec:Device Types / Video Device / Device Op=
eration / Device Operation: Stream commands / UNBLOCK}.
> +            \end{description}
> +\end{description}
> +
> +The particular data structure representing the event is selected accordi=
ng to
> +the \field{event_type}.
> +
> +\drivernormative{\paragraph}{Device Operation: Event Virtqueue}{Device T=
ypes / Video Device / Device Operation / Device Operation:
> Event Virtqueue}
> +
> +The driver MUST at any time have at least one descriptor with a used
> +buffer large enough to contain a \field{struct virtio_video_event}
> +queued on the eventq.
> +
> +The driver MUST NOT put device-readable descriptors into the eventq.
> +
> +The driver MUST account for the fact that the async responses to command=
s
> +might come out-of-order (i.e. after other commands sent to the device),
> +and that some of them can be cancelled.
> +
> +The driver SHOULD wait for an async response of command A, that caused
> +cancellation of command B, before queueing the command B again.
> +
> +\subsubsection{Device Operation: TLV format}
> +\label{sec:Device Types / Video Device / Device Operation / Device Opera=
tion: TLV format}
> +
> +VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS and VIRTIO_VIDEO_CMD_STREAM_SET_PARAM=
S/
> +VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS
> +commands represent device capabilities and corresponding device paramete=
rs
> +in the form of TLV (Type-Length-Value):
> +
> +\begin{lstlisting}
> +struct virtio_video_tlv {
> +        le32 type;
> +        le32 length;
> +        u8 value[length];
> +};
> +\end{lstlisting}
> +
All the caps can be crafted using existing capabilities infra. Please restr=
ucture the patch to use it.

> +\begin{description}
> +      \item[\field{type}]
> +            specifies the type of data in \field{value}.
> +      \item[\field{length}]
> +            specifies the \field{value} size in bytes aligned to 4 bytes=
.
> +      \item[\field{value}]
> +            contains the data according to the type.
> +\end{description}
> +
> +The following TLV types are defined:
> +
> +\begin{lstlisting}
> +#define VIRTIO_VIDEO_TLV_CODED_SET                1
> +#define VIRTIO_VIDEO_TLV_RAW_SET                  2
> +#define VIRTIO_VIDEO_TLV_LINK                     3
> +#define VIRTIO_VIDEO_TLV_CODED_FORMAT             4
> +#define VIRTIO_VIDEO_TLV_RAW_FORMAT               5
> +#define VIRTIO_VIDEO_TLV_CODED_RESOURCES          6
> +#define VIRTIO_VIDEO_TLV_RAW_RESOURCES            7
> +#define VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES     8
> +#define VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT   9
> +#define VIRTIO_VIDEO_TLV_CROP                     10
> +#define VIRTIO_VIDEO_TLV_V4L2_CONTROLS            11
> +\end{lstlisting}
> +
You can use the 'flow filter' example of network device to see how to frame=
 the individual or group of capabilities.

> +Some TLVs are used only as containers for sequences of nested TLVs:
> +
> +\begin{description}
> +      \item[\field{VIRTIO_VIDEO_TLV_CODED_SET}]
> +            groups various capabilities or parameters related to a parti=
cular coded
> +            format.
> +      \item[\field{VIRTIO_VIDEO_TLV_RAW_SET}]
> +            groups various capabilities or parameters related to a parti=
cular raw
> +            format.
> +      \item[\field{VIRTIO_VIDEO_TLV_V4L2_CONTROLS}]
> +            contains V4L2 controls represented in the TLV format. Within=
 this container
> +            only selected V4L2 control identifiers (V4L2_CID_*) are allo=
wed to be used
> +            in the TLV \field{type} field, see
> +            \ref{sec:Device Types / Video Device / Device capabilities a=
nd parameters / CODED / V4L2 CONTROLS}.
> +\end{description}
> +
> +TLV with type VIRTIO_VIDEO_TLV_LINK is a special one used to define rela=
tions
> +between sets of capabilities, see
> +\ref{sec:Device Types / Video Device / Device Operation / Device Operati=
on: Device Commands / QUERY CAPS}.
> +
> +For each of the remaining TLV types two different contained data formats=
 are
> +defined: one for the capabilities and one for the specific parameter val=
ues.
> +
> +\field{struct virtio_video_range} is used to represent a range of values=
 in
> +some TLVs:
> +
> +\begin{lstlisting}
> +struct virtio_video_range {
> +        le32 min;
> +        le32 max;
> +        le32 step;
> +        u8 padding[4];
> +};
> +\end{lstlisting}
> +
> +An integer \(x\) is within the range \field{r} if
> +\(\field{r.min} \le x \le \field{r.max}\) holds and \(x\) equals to
> +\((\field{min} + \field{step} * n)\) for some integer \(n\).
> +
> +\devicenormative{\paragraph}{Device Operation: TLV format}{Device Types =
/ Video Device / Device Operation / Device Operation: TLV
> format}
> +
> +\field{min}, \field{step} and \field{max} MUST be positive.
> +
> +\field{min} MUST be less then or equal to \field{max} within the same ra=
nge.
> +
> +\subsubsection{Device Operation: Device Commands}
> +\label{sec:Device Types / Video Device / Device Operation / Device Opera=
tion: Device Commands}
> +
> +This command allows retrieving the device capabilities.
> +
> +\paragraph{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}
> +\label{sec:Device Types / Video Device / Device Operation / Device Opera=
tion: Device Commands / QUERY CAPS}
> +
> +Retrieve device capabilities for all available stream parameters (for ex=
ample,
> +the range of values).
> +
> +The driver sends this command with
> +\field{struct virtio_video_device_query_caps}:
> +
> +\begin{lstlisting}
> +struct virtio_video_device_query_caps {
> +        le32 type; /* VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS */
> +};
> +\end{lstlisting}
> +
> +The device responds with
> +\field{struct virtio_video_device_query_caps_resp}:
> +
> +\begin{lstlisting}
> +
> +#define VIRTIO_VIDEO_RESULT_OK      0
> +#define VIRTIO_VIDEO_RESULT_ERROR   1
> +
> +struct virtio_video_device_query_caps_resp {
> +        le32 result; /* VIRTIO_VIDEO_RESULT_* */
> +        u8 padding[4];
> +        /**
> +         * Followed by a sequence of TLVs up to caps_length
> +         * counted in bytes from the beginning of the struct.
> +         */
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{result}]
> +            is
> +
> +            \begin{description}
> +                  \item[VIRTIO_VIDEO_RESULT_OK]
> +                        if the command succeeded,
> +                  \item[VIRTIO_VIDEO_RESULT_ERROR]
> +                        if the descriptor was smaller than the defined \=
field{caps_length} in
> +                        the video device configuration.
> +            \end{description}
> +\end{description}
> +
> +The sequence of TLVs consists of TLV containers VIRTIO_VIDEO_TLV_CODED_S=
ET
> +and VIRTIO_VIDEO_TLV_RAW_SET defining sets of possible coded, or respect=
ively
> +raw formats, including the corresponding parameters (e.g. profiles, leve=
ls
> +or format modifiers, resolutions), that are supported by the device. For=
 the
> +details see
> +\ref{sec:Device Types / Video Device / Device capabilities and parameter=
s}.
> +The last TLVs in the sequence with type VIRTIO_VIDEO_TLV_LINK establish
> +relations between the two groups. If there is a link, then the device su=
pports
> +decoding from the specified coded set to the specified raw set, or encod=
ing in
> +the opposite direction. The value format is defined as follows:
> +
> +\begin{lstlisting}
> +#define VIRTIO_VIDEO_STREAM_TYPE_DECODER 0
> +#define VIRTIO_VIDEO_STREAM_TYPE_ENCODER 1
> +
> +struct virtio_video_tlv_link {
> +        le32 stream_type; /* One of VIRTIO_VIDEO_STREAM_TYPE_* */
> +        u8 padding[4];
> +        le64 links[n_coded * (n_raw + 63) / 64];
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{stream_type}]
> +            is the type of the stream that is supported and negotiated u=
sing
> +            the respective feature flags.
> +      \item[\field{n_coded}]
> +            is the number of VIRTIO_VIDEO_TLV_CODED_SET containers.
> +      \item[\field{n_raw}]
> +            is the number of VIRTIO_VIDEO_TLV_RAW_SET containers.
> +      \item[\field{links}]
> +            is a bitset establishing links between coded and raw sets. F=
or \field{i}-th
> +            coded and \field{j}-th raw sets counted from zero bit \field=
{(j \% 64)} in
> +            \field{links[i * (n_raw + 63) / 64 + j / 64]} defines the li=
nk if it is set.
> +\end{description}
> +
> +\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}{Devi=
ce Types / Video Device / Device Operation / Device
> Operation: Device Commands / QUERY CAPS}
> +
> +Response to the command MUST be written by the device in the first
> +device-writable descriptor of the descriptor chain from which the comman=
d
> +came.
> +
> +The device MUST include into the response at least one
> +VIRTIO_VIDEO_TLV_CODED_SET and at least one VIRTIO_VIDEO_TLV_RAW_SET TLV
> +containers, and one VIRTIO_VIDEO_TLV_LINK TLV defining links between the=
 coded
> +and raw sets for each VIRTIO_VIDEO_F_ENCODER and VIRTIO_VIDEO_F_DECODER
> +feature flag that is negotiated. The VIRTIO_VIDEO_TLV_LINK TLVs MUST be =
the
> +last in the sequence.
> +
> +Each VIRTIO_VIDEO_TLV_CODED_SET and VIRTIO_VIDEO_TLV_RAW_SET MUST take p=
art
> +in at least one defined link in one of the VIRTIO_VIDEO_TLV_LINK TLVs.
> +
> +Each VIRTIO_VIDEO_TLV_CODED_SET MUST contain exactly one
> +VIRTIO_VIDEO_TLV_CODED_FORMAT TLV, exactly one
> +VIRTIO_VIDEO_TLV_CODED_RESOURCES TLV and at most one TLV of other types.
> +
> +Each VIRTIO_VIDEO_TLV_RAW_SET MUST contain exactly one
> +VIRTIO_VIDEO_TLV_RAW_FORMAT TLV, exactly one VIRTIO_VIDEO_TLV_RAW_RESOUR=
CES
> +TLV and at most one TLV of other types.
> +
> +VIRTIO_VIDEO_TLV_RAW_SET containers SHOULD be ordered according to raw f=
ormat
> +preferences of the device from preferred to not preferred ones.
> +
> +The total size of the response MUST be equal to \field{caps_length}
> +bytes, as reported by the device configuration.
> +
> +\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}{Devi=
ce Types / Video Device / Device Operation / Device
> Operation: Device Commands / QUERY CAPS}
> +
> +Descriptor chains sent to the commandq by the driver MUST include at lea=
st one
> +device-writable descriptor. The combined length of all such descriptors =
MUST
> +be at least \field{caps_length} bytes.
> +
> +\subsubsection{Device Operation: Stream commands}
> +\label{sec:Device Types / Video Device / Device Operation / Device Opera=
tion: Stream commands}
> +
> +Stream commands allow to open, close and control the flow of a stream.
> +
> +\paragraph{VIRTIO_VIDEO_CMD_STREAM_OPEN}
> +\label{sec:Device Types / Video Device / Device Operation / Device Opera=
tion: Stream commands / OPEN}
> +
> +Open a video stream.
> +
> +The driver sends this command with \field{struct virtio_video_stream_ope=
n}:
> +
> +\begin{lstlisting}
> +struct virtio_video_stream_open {
> +        struct virtio_video_stream_cmd_header hdr; /* VIRTIO_VIDEO_CMD_S=
TREAM_OPEN -> mainqX */
> +        le32 stream_type; /* One of VIRTIO_VIDEO_STREAM_TYPE_* */
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{hdr.stream_id}]
> +            is the ID of the stream to be opened.
> +      \item[\field{stream_type}]
> +            is the type of the stream to be opened.
> +\end{description}
> +
> +The device begins an async OPEN operation. When the operation is complet=
ed the
> +device sends the VIRTIO_VIDEO_CMD_STREAM_OPEN async response, see
> +\ref{sec:Device Types / Video Device / Device Operation / Device Operati=
on: Event Virtqueue}.
> +
> +\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_OPEN}{Device Typ=
es / Video Device / Device Operation / Device
> Operation: Stream commands / OPEN}
> +
> +The device MUST ensure that the \field{stream_id} is within limits and t=
hat
> +the corresponding stream is not open.
> +
> +\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_OPEN}{Device Typ=
es / Video Device / Device Operation / Device
> Operation: Stream commands / OPEN}
> +
> +VIRTIO_VIDEO_CMD_STREAM_OPEN MUST be sent to mainqX.
> +
> +\paragraph{VIRTIO_VIDEO_CMD_STREAM_CLOSE}
> +\label{sec:Device Types / Video Device / Device Operation / Device Opera=
tion: Stream commands / CLOSE}
> +
> +% Use-case: the guest user-space app closes the file descriptor. Cleanup=
 fast.
> +
> +Close a video stream. Any activity on the stream is halted and all resou=
rces
> +are released by the time the async response is received by the driver.
> +
> +The driver sends this command with
> +\field{struct virtio_video_stream_close}:
> +
> +\begin{lstlisting}
> +struct virtio_video_stream_close {
> +        struct virtio_video_stream_cmd_header hdr; /* VIRTIO_VIDEO_CMD_S=
TREAM_CLOSE -> mainqX */
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{stream_id}]
> +            is the ID of the stream to be closed.
> +\end{description}
> +
> +The device begins an async CLOSE operation, that consists of RESET opera=
tions
> +on inputqX and outputqX, see
> +\ref{sec:Device Types / Video Device / Device Operation / Device Operati=
on: Stream commands / QUEUE RESET},
> +detaching all the resources, releasing the internal stream queues and an=
y
> +corresponding internal resources. When the CLOSE operation is completed =
the
> +device sends the VIRTIO_VIDEO_CMD_STREAM_CLOSE async response, see
> +\ref{sec:Device Types / Video Device / Device Operation / Device Operati=
on: Event Virtqueue}.
> +The same async response can also come after an unrecoverable stream erro=
r, see
> +\ref{sec:Device Types / Video Device / Device Operation / Device Operati=
on: Standalone Events / Error Event}.
> +
> +\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_CLOSE}{Device Ty=
pes / Video Device / Device Operation / Device
> Operation: Stream commands / CLOSE}
> +
> +After VIRTIO_VIDEO_CMD_STREAM_CLOSE is queued, the device MUST send an a=
sync
> +response with VIRTIO_VIDEO_EVENT_FLAG_ERROR flag set to any subsequently
> +queued command with this stream ID except VIRTIO_VIDEO_CMD_STREAM_OPEN.
> +
> +The CLOSE operation MUST NOT be canceled.
> +
> +\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_CLOSE}{Device Ty=
pes / Video Device / Device Operation / Device
> Operation: Stream commands / CLOSE}
> +
> +\field{stream_id} MUST be set to a valid stream ID of an open stream.
> +
> +VIRTIO_VIDEO_CMD_STREAM_CLOSE MUST be sent to mainqX.
> +
> +\paragraph{VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}
> +\label{sec:Device Types / Video Device / Device Operation / Device Opera=
tion: Stream commands / SET PARAMS}
> +
> +Set selected parameters of inputqX or outputqX of a given stream and rec=
eive
> +back the actual values of the set parameters. Coded parameters within a
> +VIRTIO_VIDEO_TLV_CODED_SET container belong to inputqX of a decoder stre=
am and
> +to outputqX of an encoder stream. Raw parameters within a
> +VIRTIO_VIDEO_TLV_RAW_SET container belong to outputqX of a decoder strea=
m and
> +to inputqX of an encoder stream.
> +
> +The driver sends this command with
> +\field{struct virtio_video_stream_set_params}:
> +
> +\begin{lstlisting}
> +struct virtio_video_stream_get_set_params {
> +        struct virtio_video_stream_cmd_header hdr; /* VIRTIO_VIDEO_CMD_S=
TREAM_SET_PARAMS */
> +        /**
> +         * Followed by a single VIRTIO_VIDEO_TLV_CODED_SET or
> +         * VIRTIO_VIDEO_TLV_RAW_SET TLV container with the parameters.
> +         */
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{hdr.stream_id}]
> +            is the ID of the stream to set parameters for.
> +\end{description}
> +
> +The command can be queued to:
> +
> +\begin{itemize}
> +      \item[\field{inputqX}]
> +            The parameters are set after all commands previously queued =
on the
> +            inputqX are processed.
> +      \item[\field{mainqX}]
> +            The parameters are set without waiting for other commands qu=
eued
> +            on inputqX to be processed.
> +\end{itemize}
> +
> +% Use-case: for the decoder, resolution can be set manually by the drive=
r
> +% (useful for codecs that do not embed this information, like MPEG-2).
> +% The processing sequence should look similar to the dynamic parameters
> +% change case.
> +% Use-case: V4L2's request API.
> +
> +Any changes to formats, decreasing resource numbers or changes to resour=
ces
> +in use trigger the following sequence:
> +\begin{enumerate}
> +      \item
> +            an implicit DRAIN operation, see
> +            \ref{sec:Device Types / Video Device / Device Operation / De=
vice Operation: Stream commands / DRAIN};
> +      \item
> +            only for changes to outputqX parameters: outputqX is blocked=
 until
> +            a VIRTIO_VIDEO_CMD_STREAM_UNBLOCK command is received, see
> +            \ref{sec:Device Types / Video Device / Device Operation / De=
vice Operation: Stream commands / UNBLOCK}.
> +            When the block is active the decoder or encoder can't get an=
ything
> +            from outputqX.
> +\end{enumerate}
> +
> +% Use-case: dynamic resolution changes on inter frames in VP9.
> +% See https://lore.kernel.org/linux-media/20240314153226.197445-1-benjam=
in.gaignard@collabora.com/
> +% Because of this buffers can't be detached/deallocated/reset the way it=
 was
> +% specified in the past when a dynamic resolution change happens. Theref=
ore
> +% the access to the outputqX is blocked until the format negotiation is
> +% finished. Otherwise there is a race condition: device sends a DPC even=
t, the
> +% driver meantime keeps queueing buffers, the device can't figure out if=
 these
> +% buffers should be used after the DPC or not. This is somewhat similar =
to
> +% V4L2_DEC_CMD_START command except that here it only covers the paramet=
er
> +% changes.
> +
> +Only the parameters returned in one of the corresponding sets in the dev=
ice
> +capabilities can be set, see
> +\ref{sec:Device Types / Video Device / Device Operation / Device Operati=
on: Device Commands / QUERY CAPS}.
> +The device checks and applies the parameter changes and sends the
> +VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS async response, see
> +\ref{sec:Device Types / Video Device / Device Operation / Device Operati=
on: Event Virtqueue}.
> +The async response can also come in case of a dynamic parameters change,=
 see
> +\ref{sec:Device Types / Video Device / Device Operation / Device Operati=
on: Standalone Events / Dynamic Parameters Change Event}.
> +
> +The command-specific async response
> +\field{struct virtio_video_stream_params_async_resp} is defined
> +as follows:
> +
> +\begin{lstlisting}
> +struct virtio_video_stream_get_set_params_async_resp {
> +        struct virtio_video_event_header hdr;
> +        /**
> +         * Followed by a single VIRTIO_VIDEO_TLV_CODED_SET or
> +         * VIRTIO_VIDEO_TLV_RAW_SET TLV container with the parameters.
> +         */
> +};
> +\end{lstlisting}
> +
> +The TLV container in the response is of the same type as in the request =
and it
> +contains the actual values of the set parameters supported by the
> +device. The values set by the device can differ from the requested value=
s
> +depending on the device's capabilities. If the TLV container in the requ=
est is
> +empty, the response is also empty. \textbf{Note:} lengths of the
> +VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES and
> +VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT TLVs are always 8 in the device'=
s
> +response in order to save memory and make eventq descriptor size more
> +predictable, i.e. they include only the \field{resource_id} fields. Miss=
ing
> +TLV for a resource means that it is not attached.
> +
> +The backing memory for resources can only be attached when there is no c=
hance
> +for it to be simultaneously used by the device.
> +
> +\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}{Devi=
ce Types / Video Device / Device Operation / Device
> Operation: Stream commands / SET PARAMS}
> +
> +The device MUST initialize each parameter to a valid default value.
> +
> +The device MUST allow each parameter to be read even without the driver
> +explicitly setting a value for them beforehand.
> +
> +The device MAY adjust any received parameter to a closest supported
> +value if the received one is not supported with the current settings.
> +
> +The parameters received and returned by the device MUST fit together int=
o a
> +pair of linked sets returned in
> +\field{struct virtio_video_device_query_caps_resp}.
> +
> +The parameters MUST be applied in the order of appearance in the TLV
> +container.
> +The device MUST send an async response with an error flag set as soon as=
 it
> +encounters an invalid not correctable input and stop processing the TLVs
> +afterwards.
> +
> +The device MUST process parameters changes, that are embedded in the inp=
ut
> +stream, in the same way as if there is a VIRTIO_VIDEO_CMD_STREAM_SET_PAR=
AMS
> +command queued into inputqX changing the outputqX parameters. A standalo=
ne DPC
> +event MUST be sent in place of the command's async response in this case=
.
> +
> +The device MUST return the changed inputqX or outputqX parameters in the
> +async response.
> +
> +If the command is interrupted with a RESET operation on inputqX or a CLO=
SE
> +operation, the device MUST send the async response with
> +VIRTIO_VIDEO_EVENT_FLAG_CANCELED flag set.
> +
> +\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}{Devi=
ce Types / Video Device / Device Operation / Device
> Operation: Stream commands / SET PARAMS}
> +
> +\field{stream_id} MUST be set to a valid stream ID of an open stream.
> +
> +VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS MUST be sent to mainqX or inputqX or
> +outputqX where X equals \field{stream_id}.
> +
> +The driver MUST put exactly one TLV container to the request with type
> +selected according to the queue type.
> +
> +The driver MUST check the actual values of the parameters as set by the
> +device and work with these values, or try to set different ones if it
> +cannot, or fail properly.
> +
> +After creating a new stream, the initial value of all parameters is
> +undefined to the driver. Thus, the driver MUST NOT assume the default
> +value of any parameter and MAY use VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS
> +in order to get the values of the parameters it needs.
> +
> +If some of the resources were detached as a result of this command the d=
river
> +SHOULD reattach the backing memories of these resources and queue them a=
gain
> +to resume the device operation.
> +
> +The same type of backing memories (either guest pages, or virtio objects=
)
> +MUST be used for all resources within a queue.
> +
> +\paragraph{VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS}
> +\label{sec:Device Types / Video Device / Device Operation / Device Opera=
tion: Stream commands / GET PARAMS}
> +
> +Get the current values of all parameters supported by the device for inp=
utqX
> +or outputqX of a given stream as reported by
> +\ref{sec:Device Types / Video Device / Device Operation / Device Operati=
on: Device Commands / QUERY CAPS}.
> +The command is very similar to VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS, excep=
t that
> +the TLV set in the command is always empty and all supported parameters =
are
> +returned by the device in the async response.
> +
> +\paragraph{VIRTIO_VIDEO_CMD_STREAM_UNBLOCK}
> +\label{sec:Device Types / Video Device / Device Operation / Device Opera=
tion: Stream commands / UNBLOCK}
> +
> +Unblock the access to outputqX after output format and resource paramete=
rs
> +negotiation between the device and the driver is finished.
> +
> +The driver sends this command with
> +\field{struct virtio_video_stream_unblock}:
> +
> +\begin{lstlisting}
> +struct virtio_video_stream_unblock {
> +        struct virtio_video_stream_cmd_header hdr; /* VIRTIO_VIDEO_CMD_S=
TREAM_UNBLOCK -> mainqX */
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{hdr.stream_id}]
> +            is the ID of the stream to continue.
> +\end{description}
> +
> +When the outputqX is unblocked the device sends the
> +VIRTIO_VIDEO_CMD_STREAM_UNBLOCK async response, see
> +\ref{sec:Device Types / Video Device / Device Operation / Device Operati=
on: Event Virtqueue}.
> +
> +\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_UNBLOCK}{Device =
Types / Video Device / Device Operation / Device
> Operation: Stream commands / UNBLOCK}
> +
> +The device MUST set the VIRTIO_VIDEO_EVENT_FLAG_ERROR flag if the output=
qX is
> +not blocked.
> +
> +\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_UNBLOCK}{Device =
Types / Video Device / Device Operation / Device
> Operation: Stream commands / UNBLOCK}
> +
> +VIRTIO_VIDEO_CMD_STREAM_UNBLOCK MUST be sent to mainqX.
> +
> +\paragraph{VIRTIO_VIDEO_CMD_STREAM_DRAIN}
> +\label{sec:Device Types / Video Device / Device Operation / Device Opera=
tion: Stream commands / DRAIN}
> +
> +Complete processing of all input resources queued before this command
> +and make the resulting output resources available to the driver.
> +
> +The driver sends this command with
> +\field{struct virtio_video_stream_drain}:
> +
> +\begin{lstlisting}
> +struct virtio_video_stream_drain {
> +        struct virtio_video_stream_cmd_header hdr; /* VIRTIO_VIDEO_CMD_S=
TREAM_DRAIN -> inputqX */
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{hdr.stream_id}]
> +            is the ID of the stream to drain.
> +\end{description}
> +
> +The device begins the async DRAIN operation. When the operation is compl=
eted
> +the device sends the VIRTIO_VIDEO_CMD_STREAM_DRAIN async response, see
> +\ref{sec:Device Types / Video Device / Device Operation / Device Operati=
on: Event Virtqueue}.
> +
> +\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_DRAIN}{Device Ty=
pes / Video Device / Device Operation / Device
> Operation: Stream commands / DRAIN}
> +
> +Before the device sends the response, it MUST process and respond to all
> +the commands on the inputqX that were sent before the drain command, and=
 make
> +all the corresponding output resources available to the driver with asyn=
c
> +responses to their VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE commands.
> +
> +The device MUST be able to accept commands to inputqX while a DRAIN oper=
ation
> +is ongoing, but any resulting async responses MUST NOT be sent before
> +the async response to the command, that started the DRAIN operation.
> +
> +If the command is interrupted with a RESET operation on inputqX or a CLO=
SE
> +operation, the device MUST send the async response with
> +VIRTIO_VIDEO_EVENT_FLAG_CANCELED flag set.
> +
> +The device MUST retain certain state after a DRAIN e.g. VPS, SPS, PPS.
> +
> +\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_DRAIN}{Device Ty=
pes / Video Device / Device Operation / Device
> Operation: Stream commands / DRAIN}
> +
> +VIRTIO_VIDEO_CMD_STREAM_DRAIN MUST be sent to inputqX.
> +
> +The driver MUST keep queueing output resources until it gets the
> +async response to this command or cancels it using
> +VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET or
> +VIRTIO_VIDEO_CMD_STREAM_CLOSE. Failure to do so may result in the
> +device stalling as it waits for output resources to write into.
> +
> +The driver MUST send a VIRTIO_VIDEO_CMD_STREAM_DRAIN command when it doe=
s not
> +have any further input to ensure it receives all the output.
> +
> +\paragraph{VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET}
> +\label{sec:Device Types / Video Device / Device Operation / Device Opera=
tion: Stream commands / QUEUE RESET}
> +
> +Immediately cancel all queued resources in inputqX or outputqX without
> +processing them and discard any processing results, that are not yet deq=
ueued.
> +This command is useful for decoders that need to quickly jump to another=
 point
> +in the stream (i.e. for seeking), or in order to clear the queue as quic=
kly as
> +possible.
> +
> +The driver sends this command with
> +\field{struct virtio_video_queue_reset}:
> +
> +\begin{lstlisting}
> +struct virtio_video_queue_reset {
> +        struct virtio_video_stream_cmd_header hdr; /* VIRTIO_VIDEO_CMD_S=
TREAM_QUEUE_RESET -> mainqX */
> +        le32 reset_queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_{INPUT|=
OUTPUT} */
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{hdr.stream_id}]
> +            is the ID of the stream to reset.
> +      \item[\field{reset_queue_type}]
> +            is the queue type to reset.
> +\end{description}
> +
> +The device begins the async RESET operation. When the async RESET operat=
ion is
> +completed the device sends the VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET async
> +response, see
> +\ref{sec:Device Types / Video Device / Device Operation / Device Operati=
on: Event Virtqueue}.
> +
> +\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET}{Dev=
ice Types / Video Device / Device Operation / Device
> Operation: Stream commands / QUEUE RESET}
> +
> +The device MUST send async responses with VIRTIO_VIDEO_EVENT_FLAG_CANCEL=
ED
> +flag set for all active or pending commands in the selected queue before
> +sending the async response to this command.
> +
> +The device MUST interrupt operation as quickly as possible. Doing a RESE=
T of
> +inputqX MUST NOT depend on output resources being queued by the driver.
> +
> +% If the device must accept more input after the beginning of the RESET
> +% like it was required in the previous versions of the specification, th=
en
> +% some more measures are necessary because these are different queues no=
w.
> +% For example, adding a "generation" field into the commands. At the mom=
ent
> +% this doesn't look like a problem because this is not supported in V4L2=
.
> +
> +The device MUST retain certain state after a RESET e.g. VPS, SPS, PPS.
> +
> +\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET}{Dev=
ice Types / Video Device / Device Operation / Device
> Operation: Stream commands / QUEUE RESET}
> +
> +\field{stream_id} MUST be set to a valid stream ID of an open stream.
> +
> +VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET MUST be sent to mainqX.
> +
> +\paragraph{VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE}
> +\label{sec:Device Types / Video Device / Device Operation / Device Opera=
tion: Stream commands / RESOURCE QUEUE}
> +
> +Provide an input or output resource to the device for processing.
> +
> +\begin{lstlisting}
> +#define VIRTIO_VIDEO_MAX_PLANES                    8
> +
> +#define VIRTIO_VIDEO_QUEUE_FLAG_KEY_FRAME         (1 << 0)
> +#define VIRTIO_VIDEO_QUEUE_FLAG_P_FRAME           (1 << 1)
> +#define VIRTIO_VIDEO_QUEUE_FLAG_B_FRAME           (1 << 2)
> +/* On dequeue only */
> +#define VIRTIO_VIDEO_QUEUE_FLAG_V4L2_DPC_LAST     (1 << 3)
> +#define VIRTIO_VIDEO_QUEUE_FLAG_V4L2_DRAIN_LAST   (1 << 4)
> +
> +struct virtio_video_resource_queue {
> +        struct virtio_video_stream_cmd_header hdr; /* VIRTIO_VIDEO_CMD_S=
TREAM_RESOURCE_QUEUE */
> +        le32 resource_id;
> +        le32 flags; /* Bitmask of VIRTIO_VIDEO_QUEUE_FLAG_* */
> +        le64 timestamp;
> +        le32 offsets[VIRTIO_VIDEO_MAX_PLANES];
> +        le32 data_sizes[VIRTIO_VIDEO_MAX_PLANES];
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{hdr.stream_id}]
> +            is the ID of the stream to provide the resource to.
> +      \item[\field{hdr.queue_type}]
> +            is either inpuqX, or outputqX.
> +      \item[\field{resource_id}]
> +            is the ID of the resource to be queued.
> +      \item[\field{flags}]
> +            is a bitmask of VIRTIO_VIDEO_QUEUE_FLAG_* values.
> +
> +            \begin{description}
> +                  \item[VIRTIO_VIDEO_QUEUE_FLAG_KEY_FRAME]
> +                        can be set on decoder input resources when the
> +                        resource contains an encoded key frame.
> +                  \item[VIRTIO_VIDEO_QUEUE_FLAG_P_FRAME]
> +                        can be set on decoder input resources when the
> +                        resource contains only differences to preceding =
frames.
> +                  \item[VIRTIO_VIDEO_QUEUE_FLAG_B_FRAME]
> +                        can be set on decoder input resources when the
> +                        resource contains the differences between the cu=
rrent
> +                        frame and both the preceding and following frame=
s.
> +            \end{description}
> +      \item[\field{timestamp}]
> +            is an abstract sequence counter that can be used on the inpu=
tqX for
> +            synchronization. Resources produced on the output queue will=
 carry the
> +            \field{timestamp} of the first input resource they have been=
 produced
> +            from.
> +      \item[\field{offsets}]
> +            is the starting offset for the data in the buffer for each p=
lane.
> +            The number of planes depends on the format. Set by the drive=
r for input
> +            resources.
> +      \item[\field{data_sizes}]
> +            is number of data bytes used for each plane. Set by the driv=
er for input
> +            resources.
> +\end{description}
> +
> +The device uses the resource in the video processing. When the processin=
g of
> +the resource is completed the device sends the
> +VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE async response, see
> +\ref{sec:Device Types / Video Device / Device Operation / Device Operati=
on: Event Virtqueue}.
> +
> +The command-specific async response
> +\field{struct virtio_video_resource_queue_async_resp} is defined
> +as follows:
> +
> +\begin{lstlisting}
> +struct virtio_video_resource_queue_async_resp {
> +        struct virtio_video_event_header hdr;
> +        le32 flags;
> +        u8 padding[4];
> +        le64 timestamp;
> +        le32 offsets[VIRTIO_VIDEO_MAX_PLANES];
> +        le32 data_sizes[VIRTIO_VIDEO_MAX_PLANES];
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{flags}]
> +            is a bitmask of VIRTIO_VIDEO_QUEUE_FLAG_* flags.
> +
> +            \begin{description}
> +                  \item[VIRTIO_VIDEO_QUEUE_FLAG_KEY_FRAME]
> +                        is set on encoder output resources when the
> +                        resource contains an encoded key frame.
> +                  \item[VIRTIO_VIDEO_QUEUE_FLAG_P_FRAME]
> +                        is set on encoder output resources when the
> +                        resource contains only differences to preceding =
frames.
> +                  \item[VIRTIO_VIDEO_QUEUE_FLAG_B_FRAME]
> +                        is set on encoder output resources when the
> +                        resource contains the differences between the cu=
rrent
> +                        frame and both the preceding and following frame=
s.
> +            \end{description}
> +      \item[\field{timestamp}]
> +            is set on output resources to the \field{timestamp} value of=
 the first input
> +            resource that produced the resource.
> +      \item[\field{offsets}]
> +            is set on output resources to the starting offset for the da=
ta in the
> +            buffer for each plane.
> +      \item[\field{data_sizes}]
> +            is set on output resources to the amount of data written by =
the device,
> +            for each plane.
> +\end{description}
> +
> +VIRTIO_VIDEO_EVENT_FLAG_ERROR is set in event_flags of the async respons=
e on
> +resources when a non-fatal processing error has happened and the data
> +contained in the resource is likely to be corrupted.
> +
> +\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE}{=
Device Types / Video Device / Device Operation /
> Device Operation: Stream commands / RESOURCE QUEUE}
> +
> +The device MUST set VIRTIO_VIDEO_EVENT_FLAG_ERROR in the async response =
if the
> +resource has not been attached prior to queueing it, or for an attempt t=
o queue
> +a resources that is still processed asynchronously, or for resources tha=
t might
> +contain corrupted content due to an error.
> +
> +For output resources, the device MUST copy the \field{timestamp}
> +parameter of the first input resource that produced it into the async
> +response.
> +When many output resources are produced from a single input resource, th=
e
> +device MUST copy the timestamp of the input resource to all of the outpu=
t
> +resources.
> +
> +In case of encoder, the device MUST mark each output resource with one o=
f
> +VIRTIO_VIDEO_QUEUE_FLAG_KEY_FRAME, VIRTIO_VIDEO_QUEUE_FLAG_P_FRAME, or
> +VIRTIO_VIDEO_QUEUE_FLAG_B_FRAME.
> +
> +If the processing of a resource was canceled due to a stream event, a
> +VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET, or a VIRTIO_VIDEO_CMD_STREAM_CLOSE,
> +the device MUST send the corresponding async response with
> +VIRTIO_VIDEO_EVENT_FLAG_CANCELED flag set.
> +
> +When starting or resuming processing after a RESET or a DRAIN operation,=
 the
> +device MAY skip input data until it finds a point that allows it to resu=
me
> +operation properly (e.g. until a keyframe is found in the input stream o=
f a
> +decoder).
> +
> +The device MUST properly handle the case when a dequeued but still refer=
enced
> +resource is queued again.
> +
> +\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE}{=
Device Types / Video Device / Device Operation /
> Device Operation: Stream commands / RESOURCE QUEUE}
> +
> +VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE MUST be sent to inputqX or output=
qX.
> +
> +\field{resource_id} MUST be an ID of a resource, that is both allocated =
and
> +attached for the queue.
> +
> +The driver MUST be able to handle the output resources in decoding order=
 in
> +encoder case, i.e. with timestamps out of order.
> +
> +\subsubsection{Device Operation: Standalone Events}
> +\label{sec:Device Types / Video Device / Device Operation / Device Opera=
tion: Standalone Events}
> +
> +These events are caused by state changes in the device, not as an async
> +response to any command.
> +
> +\paragraph{Error Event}
> +\label{sec:Device Types / Video Device / Device Operation / Device Opera=
tion: Standalone Events / Error Event}
> +
> +The error event is sent by the device when an unrecoverable error occurs
> +during processing a stream. The device operation is the same as when
> +it receives a VIRTIO_VIDEO_CMD_STREAM_CLOSE command, see
> +\ref{sec:Device Types / Video Device / Device Operation / Device Operati=
on: Stream commands / CLOSE}
> +except that it also sets the VIRTIO_VIDEO_EVENT_FLAG_ERROR flag in the
> +response. Note that this is different from other async responses carryin=
g the
> +VIRTIO_VIDEO_EVENT_FLAG_ERROR flag. The latter indicates that e.g. the
> +particular output frame might be corrupted, but the stream still exists
> +and can recover.
> +
> +\paragraph{Dynamic Parameters Change Event}
> +\label{sec:Device Types / Video Device / Device Operation / Device Opera=
tion: Standalone Events / Dynamic Parameters Change Event}
> +
> +A Dynamic Parameters Change (or DPC) event is sent by a decoder device w=
hen it
> +detects that the parameters of the stream being decoded have changed.
> +The device operation is the same as if it receives a
> +VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS command in the inputqX at the exact s=
ame
> +point in the stream, that changes outputqX parameters, see
> +\ref{sec:Device Types / Video Device / Device Operation / Device Operati=
on: Stream commands / SET PARAMS}.
> +This includes activating the outputqX block if necessary.
> +
> +% TODO add QoS events and overall think about quotas. Codecs are normall=
y
> +% limited by bandwidth/macroblocks per second. How can we accommodate th=
is?
> +
> +\subsection{Device capabilities and parameters}
> +\label{sec:Device Types / Video Device / Device capabilities and paramet=
ers}
> +
> +\subsubsection{VIRTIO_VIDEO_TLV_CODED_SET}
> +\label{sec:Device Types / Video Device / Device capabilities and paramet=
ers / CODED}
> +
> +These parameters are defined for the coded parameter sets.
> +
> +\paragraph{VIRTIO_VIDEO_TLV_CODED_FORMAT}
> +\label{sec:Device Types / Video Device / Device capabilities and paramet=
ers / CODED / FORMAT}
> +
> +The following coded formats are defined:
> +
> +\begin{lstlisting}
> +#define VIRTIO_VIDEO_CODED_FORMAT_MPEG2  1  /* MPEG-2 Part 2  (V4L2_PIX_=
FMT_MPEG2) */
> +#define VIRTIO_VIDEO_CODED_FORMAT_MPEG4  2  /* MPEG-4 Part 2  (V4L2_PIX_=
FMT_MPEG4) */
> +#define VIRTIO_VIDEO_CODED_FORMAT_H264   3  /* H.264          (V4L2_PIX_=
FMT_H264)  */
> +#define VIRTIO_VIDEO_CODED_FORMAT_HEVC   4  /* HEVC aka H.265 (V4L2_PIX_=
FMT_HEVC)  */
> +#define VIRTIO_VIDEO_CODED_FORMAT_VP8    5  /* VP8            (V4L2_PIX_=
FMT_VP8)   */
> +#define VIRTIO_VIDEO_CODED_FORMAT_VP9    6  /* VP9            (V4L2_PIX_=
FMT_VP9)   */
> +#define VIRTIO_VIDEO_CODED_FORMAT_FWHT   7  /* FWHT           (V4L2_PIX_=
FMT_FWHT)  */
> +\end{lstlisting}
> +
> +The coded formats and the expected data units per buffer are documented =
in
> +\hyperref[intro:V4L2]{V4L2 header} and
> +\hyperref[intro:V4L2 compressed]{V4L2 compressed formats documentation}.
> +
> +\field{struct virtio_video_tlv_coded_format} represents both the coded f=
ormat
> +in a coded set of capabilities and the specific parameter values:
> +
> +\begin{lstlisting}
> +struct virtio_video_tlv_coded_format {
> +        le32 format; /* VIRTIO_VIDEO_CODED_FORMAT_* */
> +};
> +\end{lstlisting}
> +
> +\paragraph{VIRTIO_VIDEO_TLV_CODED_RESOURCES}
> +\label{sec:Device Types / Video Device / Device capabilities and paramet=
ers / CODED / RESOURCES}
> +
> +Setup common coded resources parameters.
> +
> +\field{struct virtio_video_tlv_coded_resources_caps} represents capabili=
ties:
> +
> +\begin{lstlisting}
> +struct virtio_video_tlv_coded_resources_caps {
> +        struct virtio_video_range num_resources_range;
> +        struct virtio_video_range resource_size_range;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{num_resources_range}]
> +            is the supported range of resources number of a particular c=
oded set.
> +      \item[\field{resource_size_range}]
> +            is the supported range of resource sizes.
> +\end{description}
> +
> +\field{struct virtio_video_tlv_resources_val} represents the parameter v=
alues:
> +
> +\begin{lstlisting}
> +struct virtio_video_tlv_resources_val {
> +        le32 num_resources;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{num_resources}]
> +            is the number of resources that can be addressed for the que=
ue, numbered
> +            from \(0\) to \(num\_resources - 1\). Setting this parameter=
 to zero is
> +            allowed even when \field{num_resources_range.min} is positiv=
e, this results
> +            in detaching all the resources.
> +\end{description}
> +
> +\paragraph{VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES}
> +\label{sec:Device Types / Video Device / Device capabilities and paramet=
ers / CODED / RESOURCE GUEST PAGES}
> +
> +This TLV is defined in the same way as for the VIRTIO_VIDEO_TLV_RAW_SET,=
 see
> +\ref{sec:Device Types / Video Device / Device capabilities and parameter=
s / RAW / RESOURCE GUEST PAGES}.
> +Note, that a coded resource can only have a single buffer, so only the f=
irst
> +element of \field{num_entries} is not zero.
> +
> +\paragraph{VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT}
> +\label{sec:Device Types / Video Device / Device capabilities and paramet=
ers / CODED / RESOURCE VIRTIO OBJECT}
> +
> +This TLV is defined in the same way as for the VIRTIO_VIDEO_TLV_RAW_SET,=
 see
> +\ref{sec:Device Types / Video Device / Device capabilities and parameter=
s / RAW / RESOURCE VIRTIO OBJECT}.
> +Note, that a coded resource can only have a single buffer, so
> +\field{num_objects} is always 1.
> +
> +\paragraph{VIRTIO_VIDEO_TLV_V4L2_CONTROLS}
> +\label{sec:Device Types / Video Device / Device capabilities and paramet=
ers / CODED / V4L2 CONTROLS}
> +
> +Inside this TLV container only selected V4L2 control IDs are allowed to =
be
> +used as TLV types. The subset is listed in subsections below. Values of =
the
> +V4L2 controls can be converted to TLVs by taking their representation as
> +\hyperref[intro:V4L2 ext ctrls]{struct v4l2_ext_control} and replacing t=
he
> +pointers with values. Capabilities of the V4L2 controls can't be convert=
ed to
> +TLVs as easily, so they are described below. This is mostly useful for
> +encoders. Most relevant V4L2 controls are codec-specific. All definition=
s
> +related to V4L2 controls can be found in
> +\hyperref[intro:V4L2 controls]{V4L2 controls header}, their descriptions
> +can be found in \hyperref[intro:V4L2 codec controls]{V4L2 documentation}=
.
> +
> +\devicenormative{\subparagraph}{VIRTIO_VIDEO_TLV_V4L2_CONTROLS}{Device T=
ypes / Video Device / Device capabilities and parameters
> / CODED / V4L2 CONTROLS}
> +
> +The device MUST NOT advertise codec-specific parameters not correspondin=
g to
> +the coded format of the particular coded set.
> +
> +\subparagraph{V4L2 controls: 32 bit integers}
> +\label{sec:Device Types / Video Device / Device capabilities and paramet=
ers / CODED / V4L2 CONTROLS / V4L2 controls: 32 bit integers}
> +
> +Integer V4L2 controls are signed by default, but this specification does=
n't
> +define any signed integer types, see \ref{sec:Structure Specifications},=
 so
> +not every integer V4L2 control could be used directly. Still for many of=
 them
> +negative values don't make sense, so these controls are allowed in the r=
ange
> +from 0 to INT32_MAX:
> +
> +\begin{itemize}
> +      \item V4L2_CID_MPEG_VIDEO_BITRATE: bitrate in bits per second
> +\end{itemize}
> +
> +For capabilities the TLV value is defined as follows:
> +
> +\begin{lstlisting}
> +struct virtio_video_tlv_v4l2_int_caps {
> +        struct virtio_video_range range;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{range}]
> +            is a range of possible values of the control.
> +\end{description}
> +
> +For the control values the TLV value is defined as follows:
> +
> +\begin{lstlisting}
> +struct virtio_video_tlv_v4l2_int_val {
> +        le32 value;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{value}]
> +            is one of the supported control values.
> +\end{description}
> +
> +\drivernormative{\subparagraph}{V4L2 controls: 32 bit integers}{Device T=
ypes / Video Device / Device capabilities and parameters / CODED
> / V4L2 CONTROLS / V4L2 controls: 32 bit integers}
> +
> +The integer V4L2 control values MUST be in the range from 0 to INT32_MAX=
.
> +
> +\subparagraph{V4L2 controls: Enumerations}
> +\label{sec:Device Types / Video Device / Device capabilities and paramet=
ers / CODED / V4L2 CONTROLS / V4L2 controls: Enumerations}
> +
> +The following V4L2 controls with values defined as enums are allowed:
> +\begin{itemize}
> +      \item V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE
> +            % enum v4l2_mpeg_video_mpeg2_profile: V4L2_MPEG_VIDEO_MPEG2_=
PROFILE_*
> +      \item V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL
> +            % enum v4l2_mpeg_video_mpeg2_level: V4L2_MPEG_VIDEO_MPEG2_LE=
VEL_*
> +      \item V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE
> +            % enum v4l2_mpeg_video_mpeg4_profile: V4L2_MPEG_VIDEO_MPEG4_=
PROFILE_*
> +      \item V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL
> +            % enum v4l2_mpeg_video_mpeg4_level: V4L2_MPEG_VIDEO_MPEG4_LE=
VEL_*
> +      \item V4L2_CID_MPEG_VIDEO_H264_PROFILE
> +            % enum v4l2_mpeg_video_h264_profile: V4L2_MPEG_VIDEO_H264_PR=
OFILE_*
> +      \item V4L2_CID_MPEG_VIDEO_H264_LEVEL
> +            % enum v4l2_mpeg_video_h264_level: V4L2_MPEG_VIDEO_H264_LEVE=
L_*
> +      \item V4L2_CID_MPEG_VIDEO_HEVC_PROFILE
> +            % enum v4l2_mpeg_video_hevc_profile: V4L2_MPEG_VIDEO_HEVC_PR=
OFILE_*
> +      \item V4L2_CID_MPEG_VIDEO_HEVC_LEVEL
> +            % enum v4l2_mpeg_video_hevc_level: V4L2_MPEG_VIDEO_HEVC_LEVE=
L_*
> +      \item V4L2_CID_MPEG_VIDEO_VP8_PROFILE
> +            % enum v4l2_mpeg_video_vp8_profile: V4L2_MPEG_VIDEO_VP8_PROF=
ILE_*
> +      \item V4L2_CID_MPEG_VIDEO_VP9_PROFILE
> +            % enum v4l2_mpeg_video_vp9_profile: V4L2_MPEG_VIDEO_VP9_PROF=
ILE_*
> +      \item V4L2_CID_MPEG_VIDEO_VP9_LEVEL
> +            % enum v4l2_mpeg_video_vp9_level: V4L2_MPEG_VIDEO_VP9_LEVEL_=
*
> +\end{itemize}
> +
> +For capabilities the TLV value is defined as follows:
> +
> +\begin{lstlisting}
> +#define MASK(x) (1 << (x))
> +
> +struct virtio_video_tlv_v4l2_enum_caps {
> +        le32 bitmask; /* Bitmask of MASK(<enum value>) */
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{bitmask}]
> +            is a bitmask of supported enum values used as bit numbers, s=
ee
> +            \hyperref[intro:V4L2 controls]{V4L2 controls header}.
> +\end{description}
> +
> +For the control values the TLV value is defined as follows:
> +
> +\begin{lstlisting}
> +struct virtio_video_tlv_v4l2_enum_val {
> +        u8 value; /* <enum value> */
> +        u8 padding[3];
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{value}]
> +            is one of the supported enum values, see
> +            \hyperref[intro:V4L2 controls]{V4L2 controls header}.
> +\end{description}
> +
> +\subsubsection{VIRTIO_VIDEO_TLV_RAW_SET}
> +\label{sec:Device Types / Video Device / Device capabilities and paramet=
ers / RAW}
> +
> +These parameters are defined for the raw parameter sets.
> +
> +\paragraph{VIRTIO_VIDEO_TLV_RAW_FORMAT}
> +\label{sec:Device Types / Video Device / Device capabilities and paramet=
ers / RAW / FORMAT}
> +
> +DRM fourcc format definitions and DRM format modifiers are used to repre=
sent
> +raw formats capabilities and values. The layouts of raw formats are docu=
mented
> +in \hyperref[intro:DRM formats]{DRM} and \hyperref[intro:V4L2]{V4L2} hea=
ders,
> +as well as in \hyperref[intro:V4L2 RGB]{V4L2 RGB} and
> +\hyperref[intro:V4L2 YUV]{planar YUV} formats documentation.
> +
> +% Some DRM and V4L2 formats can be matched with this table:
> +% DRM_FORMAT_ARGB8888 =3D V4L2_PIX_FMT_ABGR32
> +% DRM_FORMAT_BGRA8888 =3D V4L2_PIX_FMT_ARGB32
> +% DRM_FORMAT_RGBA8888 =3D V4L2_PIX_FMT_BGRA32
> +% DRM_FORMAT_NV12     =3D V4L2_PIX_FMT_NV12
> +% DRM_FORMAT_YUV420   =3D V4L2_PIX_FMT_YUV420
> +% DRM_FORMAT_YVU420   =3D V4L2_PIX_FMT_YVU420
> +% DRM_FORMAT_YUYV     =3D V4L2_PIX_FMT_YUYV
> +
> +\field{struct virtio_video_tlv_raw_format_caps} is used to describe the
> +capabilities:
> +
> +\begin{lstlisting}
> +enum virtio_video_planes_layout {
> +        VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER =3D 1,
> +        VIRTIO_VIDEO_PLANES_LAYOUT_MULTI_BUFFERS =3D 2,
> +};
> +
> +struct virtio_video_tlv_raw_format_caps {
> +        le32 planes_layout_mask; /* Bitmask of VIRTIO_VIDEO_PLANES_LAYOU=
T_* */
> +        le32 fourcc; /* DRM_FORMAT_* */
> +        le64 modifier; /* DRM_FORMAT_MOD_* */
> +        struct virtio_video_range width_range;
> +        struct virtio_video_range height_range;
> +        le32 stride_align_mask;
> +        le32 height_align_mask;
> +        le32 plane_align_mask;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{planes_layout_mask}]
> +            is a bitmask of supported planes layout types according to
> +            \field{enum virtio_video_planes_layout}.
> +      \item[\field{fourcc}]
> +            specifies the raw format, to which these capabilities apply.
> +      \item[\field{modifier}]
> +            specifies the raw format modifier.
> +      \item[\field{width_range}]
> +            is a range of widths in pixels.
> +      \item[\field{height_range}]
> +            is a range of heights in pixels.
> +      \item[\field{stride_align_mask}]
> +            is a bitmask of all supported power of two alignments of the=
 distance in
> +            bytes between two lines of data (stride).
> +      \item[\field{height_align_mask}]
> +            is a bitmask of all supported power of two height alignments=
 in pixels (scanlines).
> +      \item[\field{plane_align_mask}]
> +            is a bitmask of all supported power of two alignments in byt=
es of planes
> +            within a buffer. This field is valid only if \field{planes_l=
ayout_mask} has
> +            the \field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER} bit set=
.
> +\end{description}
> +
> +\field{struct virtio_video_tlv_raw_format_val} is used to describe the
> +values:
> +
> +\begin{lstlisting}
> +struct virtio_video_tlv_raw_format_val {
> +        le32 planes_layout; /* VIRTIO_VIDEO_PLANES_LAYOUT_* */
> +        le32 fourcc; /* DRM_FORMAT_* */
> +        le64 modifier; /* DRM_FORMAT_MOD_* */
> +        le32 width;
> +        le32 height;
> +        le32 stride_align;
> +        le32 height_align;
> +        le32 plane_align;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{planes_layout}]
> +            is the actual layout of the planes.
> +      \item[\field{fourcc}]
> +            specifies the raw format.
> +      \item[\field{modifier}]
> +            specifies the raw format modifier.
> +      \item[\field{width}]
> +            is the width in pixels of the stream frames.
> +      \item[\field{height}]
> +            is the height in pixels of the stream frames.
> +      \item[\field{stride_align}]
> +            is the power of two stride alignment in bytes.
> +      \item[\field{height_align}]
> +            is the power of two height alignment in pixels (scanlines).
> +      \item[\field{plane_align}]
> +            is the power of two alignment in bytes of planes within a bu=
ffer. This field
> +            is valid only if \field{planes_layout} has the
> +            \field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER} bit set.
> +\end{description}
> +
> +% TODO: add colorimetry
> +
> +\devicenormative{\subparagraph}{VIRTIO_VIDEO_TLV_RAW_FORMAT}{Device Type=
s / Video Device / Device capabilities and parameters /
> RAW / FORMAT}
> +
> +The device MUST set \field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER} bit=
 in
> +\field{planes_layout_mask} if the plane layout with planes of a frame la=
id out
> +one after another in the same buffer is supported.
> +
> +The device MUST set \field{VIRTIO_VIDEO_PLANES_LAYOUT_MULTI_BUFFERS} bit=
 in
> +\field{planes_layout_mask} if the plane layout with planes of a frame la=
id out
> +in separate buffers is supported.
> +
> +% TODO: not sure if !VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG should be compat=
ible
> +% with VIRTIO_VIDEO_PLANES_LAYOUT_MULTI_BUFFERS or not.
> +
> +\paragraph{VIRTIO_VIDEO_TLV_RAW_RESOURCES}
> +\label{sec:Device Types / Video Device / Device capabilities and paramet=
ers / RAW / RESOURCES}
> +
> +\field{struct virtio_video_tlv_raw_resources_caps} represents capabiliti=
es:
> +
> +\begin{lstlisting}
> +struct virtio_video_tlv_raw_resources_caps {
> +        struct virtio_video_range num_resources_range;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{num_resources_range}]
> +            is the supported range of resources number of a particular r=
aw set.
> +\end{description}
> +
> +\field{struct virtio_video_tlv_resources_val} represents the parameter v=
alues,
> +see
> +\ref{sec:Device Types / Video Device / Device capabilities and parameter=
s / CODED / RESOURCES}.
> +
> +\paragraph{VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES}
> +\label{sec:Device Types / Video Device / Device capabilities and paramet=
ers / RAW / RESOURCE GUEST PAGES}
> +
> +Setup guest pages as backing memory of a resource.
> +
> +The parameter capabilities are empty. The empty TLV with zero length ind=
icates
> +the support for attaching guest pages to resources.
> +
> +\field{struct virtio_video_tlv_resource_guest_pages} represents the para=
meter
> +values:
> +
> +\begin{lstlisting}
> +struct virtio_video_resource_sg_entry {
> +        le64 addr;
> +        le32 length;
> +        u8 padding[4];
> +};
> +
> +struct virtio_video_tlv_resource_guest_pages {
> +        le32 resource_id;
> +        u8 padding[4];
> +        le32 num_entries[VIRTIO_VIDEO_MAX_PLANES];
> +        struct virtio_video_resource_sg_entry entries[];
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{resource_id}]
> +            is the ID of the resource.
> +      \item[\field{num_entries}]
> +            is the number of scatter-gather list entries in each of the =
separate buffers
> +            forming together the resource according to currently set for=
mat. Unused
> +            array elements are set to 0. Sum of the array is the length =
of the
> +            \field{entries} array.
> +      \item[\field{entries}]
> +            is an array of the scatter-gather list entries:
> +
> +            \begin{description}
> +                  \item[\field{addr}]
> +                        is a guest physical address of the start of the =
SG entry aligned to
> +                        the physical guest pages size.
> +                  \item[\field{length}]
> +                        is the length of the SG entry in bytes aligned t=
o the physical guest
> +                        pages size.
> +            \end{description}
> +\end{description}
> +
> +\drivernormative{\subparagraph}{VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES}{D=
evice Types / Video Device / Device capabilities and
> parameters / RAW / RESOURCE GUEST PAGES}
> +
> +\field{resource_id} MUST be an integer within the range of resource IDs
> +currently allocated for the queue.
> +
> +The memory regions identified by the elements of the \field{entries} arr=
ay
> +MUST NOT overlap.
> +
> +\paragraph{VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT}
> +\label{sec:Device Types / Video Device / Device capabilities and paramet=
ers / RAW / RESOURCE VIRTIO OBJECT}
> +
> +Setup virtio objects as backing memory to a resource.
> +
> +The parameter capabilities are empty. The empty TLV with zero length ind=
icates
> +the support for attaching virtio objects to resources.
> +
> +\field{struct virtio_video_tlv_resource_virtio_object} represents the pa=
rameter
> +values:
> +
> +\begin{lstlisting}
> +struct virtio_video_resource_object {
> +        u8 uuid[16];
> +};
> +
> +struct virtio_video_tlv_resource_virtio_object {
> +        le32 resource_id;
> +        le32 num_objects; /* Up to VIRTIO_VIDEO_MAX_PLANES */
> +        struct virtio_video_resource_object objects[num_objects];
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{resource_id}]
> +            is the ID of the resource.
> +      \item[\field{num_objects}]
> +            is the length of the \field{objects} array according to curr=
ently set
> +            format.
> +      \item[\field{object}]
> +            is an array of objects exported from another virtio device, =
see
> +            \ref{sec:Basic Facilities of a Virtio Device / Exporting Obj=
ects}.
> +
> +            \begin{description}
> +                  \item[uuid]
> +                        is a version 4 UUID specified by \hyperref[intro=
:rfc4122]{[RFC4122]}.
> +            \end{description}
> +\end{description}
> +
> +\drivernormative{\subparagraph}{VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT}=
{Device Types / Video Device / Device capabilities and
> parameters / RAW / RESOURCE VIRTIO OBJECT}
> +
> +\field{resource_id} MUST be an integer within the range of resource IDs
> +currently allocated for the queue.
> +
> +\paragraph{VIRTIO_VIDEO_TLV_CROP}
> +\label{sec:Device Types / Video Device / Device capabilities and paramet=
ers / RAW / CROP}
> +
> +% TODO There is no reason in doing crop if it doesn't affect the output.
> +% So the output frames have to be smaller, than the full size. In the de=
coder
> +% case this means, that the buffers can't be used as a reference. So whe=
n crop
> +% is enabled, the decoder probably has to have some intermediate buffers=
.
> +% Is it reasonable to reallocate output buffers then? It could be. So it=
 has
> +% to be decided (probably in the same way it is usually done in V4L2). I=
n the
> +% encoder case this is not a problem.
> +% Is setting compose rectangles useful at all?
> +
> +This parameter sets a rectangle covering the visible area of the frame.
> +
> +The parameter capabilities are empty. The empty TLV with zero length ind=
icates
> +the support for cropping.
> +
> +The parameter value is defined as follows:
> +
> +\begin{lstlisting}
> +struct virtio_video_tlv_crop_val {
> +        le32 left;
> +        le32 top;
> +        le32 width;
> +        le32 height;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +      \item[\field{left, top}]
> +            are coordinates of top left corner of the crop rectangle in =
pixels.
> +      \item[\field{width, height}]
> +            are dimensions of the crop rectangle in pixels.
> +\end{description}
> +
> +\devicenormative{\subparagraph}{VIRTIO_VIDEO_TLV_CROP}{Device Types / Vi=
deo Device / Device capabilities and parameters / RAW /
> CROP}
> +
> +The crop rectangle MUST be reset to full frame size on every resolution
> +change.
> diff --git a/device-types/video/device-conformance.tex b/device-types/vid=
eo/device-conformance.tex
> new file mode 100644
> index 0000000..64960ac
> --- /dev/null
> +++ b/device-types/video/device-conformance.tex
> @@ -0,0 +1,22 @@
> +\conformance{\subsection}{Video Device Conformance}
> +\label{sec:Conformance / Device Conformance / Video Device Conformance}
> +
> +A video device MUST conform to the following normative statements:
> +
> +\begin{itemize}
> +\item \ref{devicenormative:Device Types / Video Device / Feature bits}
> +\item \ref{devicenormative:Device Types / Video Device / Device configur=
ation layout}
> +\item \ref{devicenormative:Device Types / Video Device / Device Operatio=
n}
> +\item \ref{devicenormative:Device Types / Video Device / Device Operatio=
n / Device Operation: TLV format}
> +\item \ref{devicenormative:Device Types / Video Device / Device Operatio=
n / Device Operation: Device Commands / QUERY CAPS}
> +\item \ref{devicenormative:Device Types / Video Device / Device Operatio=
n / Device Operation: Stream commands / OPEN}
> +\item \ref{devicenormative:Device Types / Video Device / Device Operatio=
n / Device Operation: Stream commands / CLOSE}
> +\item \ref{devicenormative:Device Types / Video Device / Device Operatio=
n / Device Operation: Stream commands / SET PARAMS}
> +\item \ref{devicenormative:Device Types / Video Device / Device Operatio=
n / Device Operation: Stream commands / UNBLOCK}
> +\item \ref{devicenormative:Device Types / Video Device / Device Operatio=
n / Device Operation: Stream commands / DRAIN}
> +\item \ref{devicenormative:Device Types / Video Device / Device Operatio=
n / Device Operation: Stream commands / QUEUE RESET}
> +\item \ref{devicenormative:Device Types / Video Device / Device Operatio=
n / Device Operation: Stream commands / RESOURCE QUEUE}
> +\item \ref{devicenormative:Device Types / Video Device / Device capabili=
ties and parameters / CODED / V4L2 CONTROLS}
> +\item \ref{devicenormative:Device Types / Video Device / Device capabili=
ties and parameters / RAW / FORMAT}
> +\item \ref{devicenormative:Device Types / Video Device / Device capabili=
ties and parameters / RAW / CROP}
> +\end{itemize}
> diff --git a/device-types/video/driver-conformance.tex b/device-types/vid=
eo/driver-conformance.tex
> new file mode 100644
> index 0000000..ca59885
> --- /dev/null
> +++ b/device-types/video/driver-conformance.tex
> @@ -0,0 +1,20 @@
> +\conformance{\subsection}{Video Driver Conformance}
> +\label{sec:Conformance / Driver Conformance / Video Driver Conformance}
> +
> +A video driver MUST conform to the following normative statements:
> +
> +\begin{itemize}
> +\item \ref{drivernormative:Device Types / Video Device / Feature bits}
> +\item \ref{drivernormative:Device Types / Video Device / Device Operatio=
n / Device Operation: Event Virtqueue}
> +\item \ref{drivernormative:Device Types / Video Device / Device Operatio=
n / Device Operation: Device Commands / QUERY CAPS}
> +\item \ref{drivernormative:Device Types / Video Device / Device Operatio=
n / Device Operation: Stream commands / OPEN}
> +\item \ref{drivernormative:Device Types / Video Device / Device Operatio=
n / Device Operation: Stream commands / CLOSE}
> +\item \ref{drivernormative:Device Types / Video Device / Device Operatio=
n / Device Operation: Stream commands / SET PARAMS}
> +\item \ref{drivernormative:Device Types / Video Device / Device Operatio=
n / Device Operation: Stream commands / UNBLOCK}
> +\item \ref{drivernormative:Device Types / Video Device / Device Operatio=
n / Device Operation: Stream commands / DRAIN}
> +\item \ref{drivernormative:Device Types / Video Device / Device Operatio=
n / Device Operation: Stream commands / QUEUE RESET}
> +\item \ref{drivernormative:Device Types / Video Device / Device Operatio=
n / Device Operation: Stream commands / RESOURCE QUEUE}
> +\item \ref{drivernormative:Device Types / Video Device / Device capabili=
ties and parameters / CODED / V4L2 CONTROLS / V4L2 controls: 32
> bit integers}
> +\item \ref{drivernormative:Device Types / Video Device / Device capabili=
ties and parameters / RAW / RESOURCE GUEST PAGES}
> +\item \ref{drivernormative:Device Types / Video Device / Device capabili=
ties and parameters / RAW / RESOURCE VIRTIO OBJECT}
> +\end{itemize}
> diff --git a/introduction.tex b/introduction.tex
> index 9a9cbde..52efa16 100644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -113,6 +113,15 @@ \section{Normative References}\label{sec:Normative R=
eferences}
>  	\phantomsection\label{intro:SEC1}\textbf{[SEC1]} &
>      Standards for Efficient Cryptography Group(SECG), ``SEC1: Elliptic C=
ureve Cryptography'', Version 1.0, September 2000.
>  	\newline\url{https://www.secg.org/sec1-v2.pdf}\\
> +	\phantomsection\label{intro:V4L2}\textbf{[V4L2]} &
> +	Linux V4L2 interface.
> +	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git/tree/include/uapi/linux/videodev2.h}\\
> +	\phantomsection\label{intro:V4L2 controls}\textbf{[V4L2 Controls]} &
> +	Linux V4L2 controls definitions.
> +	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git/tree/include/uapi/linux/v4l2-controls.h}\\
> +	\phantomsection\label{intro:DRM formats}\textbf{[DRM Formats]} &
> +	Linux DRM format definitions.
> +	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git/tree/include/uapi/drm/drm_fourcc.h}\\
>=20
>  	\phantomsection\label{intro:rfc2784}\textbf{[RFC2784]} &
>      Generic Routing Encapsulation. This protocol is only specified for I=
Pv4 and used as either the payload or delivery protocol.
> @@ -194,6 +203,18 @@ \section{Non-Normative References}
>  	\phantomsection\label{intro:Virtio PCI Draft}\textbf{[Virtio PCI Draft]=
} &
>  	Virtio PCI Draft Specification
>  	\newline\url{http://ozlabs.org/~rusty/virtio-spec/virtio-0.9.5.pdf}\\
> +	\phantomsection\label{intro:V4L2 compressed}\textbf{[V4L2 compressed fo=
rmats]} &
> +	Detailed descriptions of V4L2 compressed formats
> +	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git/tree/Documentation/userspace-
> api/media/v4l/pixfmt-compressed.rst}\\
> +	\phantomsection\label{intro:V4L2 RGB}\textbf{[V4L2 RGB formats]} &
> +	Detailed descriptions of V4L2 RGB formats
> +	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git/tree/Documentation/userspace-
> api/media/v4l/pixfmt-rgb.rst}\\
> +	\phantomsection\label{intro:V4L2 YUV}\textbf{[V4L2 planar YUV formats]}=
 &
> +	Detailed descriptions of V4L2 planar YUV formats
> +	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git/tree/Documentation/userspace-
> api/media/v4l/pixfmt-yuv-planar.rst}\\
> +	\phantomsection\label{intro:V4L2 codec controls}\textbf{[V4L2 codec con=
trols]} &
> +	Detailed descriptions of V4L2 controls
> +	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git/tree/Documentation/userspace-api/media/v4l/ext-
> ctrls-codec.rst}\\
>  \end{longtable}
>=20
>  \section{Terminology}\label{Terminology}
> --
> 2.43.0
>=20


