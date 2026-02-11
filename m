Return-Path: <linux-media+bounces-52550-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK67Kof7i2nPeQAAu9opvQ
	(envelope-from <linux-media+bounces-52550-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 04:46:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB06121100
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 04:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F375530692CA
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 03:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCE834E754;
	Wed, 11 Feb 2026 03:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="RiK79fLl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A581BD9D0;
	Wed, 11 Feb 2026 03:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770781564; cv=fail; b=hIrxqUIvI9lhvNrVuE6W8RFpFn0QVsn8GJn9R/qqHr0J/tcD4CMNh4bhuSk5CluLNrlo8SwLUGNO7eysddExxV0iYJk7HVca7u4mAOHjOObQOwBpCiDLQL8HZyrpC/QwOyobYwQvut+5uKkW9GA53BlW37E/ja3fHEietzJ8LdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770781564; c=relaxed/simple;
	bh=/KSMMRHst7h5DzsjcnG5rR1BFeKr78MjpJYXd8rMhOg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=szMMSSvsnGYVt0zwrtxcy2IQYg4JX1oNJYqzyQCmiqSW7YXdeJf+CDhf730Uk/xqTMNBh/OpuGhG3XEQrSNa2CuBLSpnZf8udVwZr7rMS+BZjwpR0ATw2g9EfoLCmyWevOkZ/29wfu3LWVxo/3G3B/Ra9qfrY/5wf1fWveUCaLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=RiK79fLl; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61ABjoZG044245;
	Wed, 11 Feb 2026 03:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=5+pO/vT0v
	x87miSJ+SAqMwJ2+bJygsCtESVriNlD13E=; b=RiK79fLlcbanVg2yHNZu2plUP
	yNh5+dmRKE9yj4kelzjDpz7TCB4w/jF1xWqSigsLYiYZ19T8N05ZyKidGLbl7VrJ
	KBtRxt79ctN/b5GmeFq+rb/1KEIBpXa5BC9d9XKShqhFn3OnqhYlqcUsk8eTssLO
	rkZhWYYzCqoKnFJ2UHllFTfo+qI5BDolHbFkNuMeiImzKZSoZq/hydiTHXov49jV
	K5Ccg88g1GdHbwaTPnhiNOBQhSURvrfVlTag1XSsdksSjRmQgFxbOMAk+v21GjYL
	83ByVH6uWy6OQ4+8799rzdJ6cZJUh7WmZpS4QzU1K37M7ELuD6D4azFgrGv7g==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013060.outbound.protection.outlook.com [40.107.201.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5vc5c6m5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 03:45:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xyzl4FB2K7s/eBeynHuz8jnxdNTBnSp7IwuvwJ11aS9bLifS9VZsn6ytlm3Vjlzi4U5UMPMm+O+vngp1ZX9x/uva7SqMgSVpLnPZOQF4qy28AfuiV4xC3cWYMmYWtYnuNlvoUNqSI/w5KoJxs9zrIKhvwdvPd3TjsjpMKqWB+QAIDFg0znjl+NGs/T7+x0l0jU3gvQtFh3WY++XXaW1muamkjHvt5hazZtjogxkb48pgO+MslD707+NJ6GG8ykmK/qnOb1HenGEEsydSux2B6UxppNG7Mp5zcTh8U8nGs21zynNVmZMMtKdvMi55TerdNQ+rPzgN+qdtaer/OMzX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+pO/vT0vx87miSJ+SAqMwJ2+bJygsCtESVriNlD13E=;
 b=mswvHryonxzFtOYten1A3j8fqiFyqKes5PaXuGaJNgXvP4L8pE3oFzMmN8j31K++t5f7PbV7G9STd29xvdclkixehrrbBvG9GjMocsYx/IHE3LeE/ZRryc6wPKxj036FWBOEZzfOccMvcMdrtaDur3NxrNYVBG2BKVyS+DuVl5n2SYpE0OM4PJ0QR2J1614OFByTehU7oKghkKpH5+OxupGYNVvcZMmThUam1QnqUJV/gS1jIfEINNExek+xk2xg3GgWZ7xpEYqgMEZIuACrheSRRjCoT0yfu5fWAuhomB7hcsR5YOVAO7G7HUW9YOrHs/YceqcicdHdYtVDJN15Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by CH3PR11MB8094.namprd11.prod.outlook.com
 (2603:10b6:610:156::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 03:45:42 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::4b21:f3ac:a1f9:6965]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::4b21:f3ac:a1f9:6965%4]) with mapi id 15.20.9587.013; Wed, 11 Feb 2026
 03:45:42 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: tomi.valkeinen@ideasonboard.com, kernel-list@raspberrypi.com,
        mchehab@kernel.org, florian.fainelli@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, hverkuil@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        xiaolei.wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: rp1-cfe: Fix double-free on video device re-registration
Date: Wed, 11 Feb 2026 11:45:01 +0800
Message-ID: <20260211034501.1815035-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::9) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|CH3PR11MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b9fa11b-3d39-406f-705a-08de692007c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3F3oMBwWF8unV3JuS2pR/K0vhfpKhdFMzrgT514dQkKCe8anCVZ6X5OO5Ujh?=
 =?us-ascii?Q?eszGG+OrNgw99v6nwruASAkS1uPqfb26nCUqxVuKStBclq1xPrttz2/MQejY?=
 =?us-ascii?Q?D14DO8X6H5+KMv0+R9BshKLrBVpt53WVFw/y2YuubnaYBv2cBKwcqMrWO69J?=
 =?us-ascii?Q?UoLNG8KbwyCg4RaVbo3NskNUstxzZYf+nhWV21pM+Ix5vRnAtC3MN0ZInmm0?=
 =?us-ascii?Q?ii+ZFvNWW//ucyRsyze2b9Z2L7DN0T4Kz4yYF+MwexjmPsCpbG34awo+3eh+?=
 =?us-ascii?Q?cfI9jirJ4TRJq5Vy1G/zl3uONKjncfySXNrgw+ZO7vz0ehosbYsU08gVet5d?=
 =?us-ascii?Q?8qZommNQZggmIdTv0aM48f3/fJ8oy68dJd8UVonktLM9sAnHiAXBEsChO9Dk?=
 =?us-ascii?Q?bJH2gkVP8dzWkIO8ezXZFbCYc3W6kWTdsc92Vwc7N56/PPJ+WcqCmE5EVgFt?=
 =?us-ascii?Q?2HT6ox+Gg9rfqmxNJPHAVjp8k00VfJb/YT+xImxzCo8MooSwfqRamRX0mGIU?=
 =?us-ascii?Q?UfwKUl40GiCQ6rPj208/mpH/UaeYIGjiE40UqpJ9EiAr8lX0Ga6Je9DmL4nA?=
 =?us-ascii?Q?nAnGU760YaPh204MXQVIpL0amWHbHolxDzalr8WZSHitQKSGHV32E5ueqEYC?=
 =?us-ascii?Q?EArb8J00jxvvJmbT2P7Qs0OfLEbabZF9CENOgBIJHwll7U3e3lpB/sme5dCB?=
 =?us-ascii?Q?YNC7U+1eIQTp5JBdAFN1MxeJJ3Aib2+4wekKtSo7WWkLYTou27DjawMAqw5R?=
 =?us-ascii?Q?BZ0SWDCoS3gzQRKruTtM6XgbAHPAlcpZuQLkKNnsuN5xBPrZ/kkKXi82szwu?=
 =?us-ascii?Q?el3Kf+8MQLiQx+1WYnCtXX90oTFVMyrfWjltUs4+xsfxnPQxlM2Ktfe2Pth3?=
 =?us-ascii?Q?fTchDjIDfOC9DL/f9QmmJym5OTEby7hTQjjyzuEOcPltG+oa17FpYdbxTxdA?=
 =?us-ascii?Q?Ylc6QMFhL+2l8uDveUnow17Pr0/iCeRDYpFyl0D+8zGnekusKW/Li58hWYm6?=
 =?us-ascii?Q?t7nd/Mds/GPjh/iwU49zjkH1bm6CummevKYpCLSeEXT/PswH0zVZ3+qTwhWs?=
 =?us-ascii?Q?5GwMy7xMThMDySb0B1MG0fLxKo78S0UDtcYW/AQfxBxcZhJ8YbkSpDfFfOu5?=
 =?us-ascii?Q?p8ngsY3oxucqMMoFb4CadimesFmSVKZo0FxoTTycMrKdWfQJ56XkZ12O6uUX?=
 =?us-ascii?Q?uB59Duk8DeCxiqlcXGmPSBSrWh5CCrnS+i7gti2T4kre7wkh8CJSA/hHmihx?=
 =?us-ascii?Q?QQf153PY1Enkt7+DzAMSU8OiTeDDMVg5DcEFk04BW5HmJuXpTQmjGeVbxUdH?=
 =?us-ascii?Q?3Jfivs1TSWRij4TyOCjJ3BxwbrR7ky2oHGY1FWcdZgcf/sH3o5rV0by9N/SN?=
 =?us-ascii?Q?8roXP8b4W8bCc4aJBF+27P16EDuSGGGqAHWILzYXDz3l7BfTszIpi9iWjO8w?=
 =?us-ascii?Q?6aEbEABpqTuva5nNkClWxrlrgwluKAkGtyGw+rV3koPIkvrdwX2U98JpqN8F?=
 =?us-ascii?Q?ObHfS7ApqhH/DoNQLq5tzZtSslq2oQI4gtOYsszNuUQxO0bh7jfTSTEy2Gne?=
 =?us-ascii?Q?f6ed7f0SUWTbny18tbfBOH6vjeLovqURlTUqijmUgSFIAJPTHmeerEzW5t4q?=
 =?us-ascii?Q?E3uoxmAwWM03PtUhDRYGwwg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rB3fnPR8FhF3x8mw2fC2sufYRe1xmZf6JI6W6tp1ofqdrun6zy7sjQR25Wzx?=
 =?us-ascii?Q?UmCmR/3OMHPwyQ1iVvqIscgcDSncSem5Eyi5eRbRgpUIUJv+h1QGco7//tX0?=
 =?us-ascii?Q?PcMXMxSaOH/Lcx90tAjPVwKgJF9X3KaqzczW8MRmHZPz9GDFKNhllIH6rIh3?=
 =?us-ascii?Q?19+yQHBWxzlZ0eVdsUcNPu+J+DfHfS5k4x8qeSYmxHvsL/kh6n7s633DnNuN?=
 =?us-ascii?Q?dA8MbpPSfoLZgyWfdGN5kkMk7qmyecwnGzVWu5NOhvtCNiqPD5TGxbF8z93w?=
 =?us-ascii?Q?l4nnzRJMiHicXDQpYFZEOk2V58/l+fGUx6mlwv3jrcEF1v2RXAQPza/h82f8?=
 =?us-ascii?Q?lcsIWJibIc+2IPyuLFFUJbMVuspJWo50kUw9OX320PhOyLOLKrUGA0HjKTt4?=
 =?us-ascii?Q?HIZAMt0Mk9QDZObsVusBocYbd0d94dahdnZPMRuEeQUTsCJ5g00JmHPe1WwN?=
 =?us-ascii?Q?t8Bmn8A+IuNclBwJ5ivifrBsLqnR8h9ubdVnnUNml8xirJOeepqdW+4S+5ir?=
 =?us-ascii?Q?uxdVZuSgllnymsngOuvIkiOVZ2g5B2UnivAd7Oibp8ogNh4IL7sCPsGH9Ic6?=
 =?us-ascii?Q?TOnnvhIZ1vWMjq6z2pKeljIAhzrBAlc0p6sAEeqv29omq8x7k+3OD3jPBULl?=
 =?us-ascii?Q?6qVVQpHFYYuiuKbfXyER2Vzwat1ikMj2K2EyODluVlR9usN1nvnYkp3mD0zh?=
 =?us-ascii?Q?7grnh7tBVXxZ+4JijRDcXT+tbHdFVBhgVmsoTer0QHmRTTgOexv6bNNC9yG+?=
 =?us-ascii?Q?Bf8shBgshemCBm3NlaoxKcnsNXosQINhWtGa4VdSWmvAeW1VxJG50Hp6fhbI?=
 =?us-ascii?Q?eueyA4NQtTUnWFgnkKPYDkYRDPM9PYv5KBnQbfnWGoGY95yXWmemlIWrodY1?=
 =?us-ascii?Q?FFBUPurHrycmpkLySqOeQvXMYD58k/3tiY1o2cHegZ39UhsruaEzH+HsWm6d?=
 =?us-ascii?Q?rrv5dNZjFj/BlOxKUUFN3HgXsVMg3gqgfSK1GnSHBIx8mFp31CNsAUMwIK53?=
 =?us-ascii?Q?UPnqNKjt7+IApsQ2mSAA6fP5hh3kNrd8hajtnY4CCD7tKOYN2S1EsdRDL0jj?=
 =?us-ascii?Q?h8fHNgkIxC5H/LKZ7HzBCAjDVBY5lwLBAq47AazCSOB2PyGDOjbLFrPeS20l?=
 =?us-ascii?Q?Y4kTZFCX4v/sqJkR82+ZZBtyxLNObcQyDG9HFPpnzuolW2d/02pbSc7U+/fD?=
 =?us-ascii?Q?MsNRwPwiYbmJ/cwV0jBt8M7fMkCaSk1u0ZrzVGrfcsdyUMYj4VhhATHhy+QM?=
 =?us-ascii?Q?+7belM+gmO34fqX8Mmg6w/9EaRiwjQYNv2ZlCrhnHR2g04Ls8Cc/DT6oxzMJ?=
 =?us-ascii?Q?KjLzAKPKcObUuuAtu1FioD8jUm1p5Urp/SA4O0w+HMkRyYh3jrGibJ5uVj6o?=
 =?us-ascii?Q?fSOWPNPL34XnymWJu51axaqTOXA44zaE3sagobTMKxg+LhCBtOboEwtOBS6K?=
 =?us-ascii?Q?6ENi+u9n4bvZU/sqjuCcnnCxw/X2G8FFD2skW12pYQg1qYhYF97OgAWvXMQE?=
 =?us-ascii?Q?omY0aqoMYdC2nSd9ZCSkhEVOgB5Jb1KGCwkN10oBxa53xJYN6J7I1vlhVdGO?=
 =?us-ascii?Q?Frlv9RXjpNogztcQusgeXND7qpyUbKX5KSDJP11pIWIkKj5aC0KKjX7x9t2o?=
 =?us-ascii?Q?wA4TKvVgtZGqM3yQpxMqPoJC+rwFk2pCAL3v2Ejh82SCch56Xr2C+rIfLen+?=
 =?us-ascii?Q?Jp+3Q8Ar/moDJYvz+R9jUW812f9vg31C3UBCWiMiQbKkaU2EtgypQubATlij?=
 =?us-ascii?Q?+DV99331FSY6cAUWCeb7o9Ps0SYB6e8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9fa11b-3d39-406f-705a-08de692007c1
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 03:45:42.5506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgJ7kOp1QXL9OJ2lIGgubpUCZB+u5KUa1g0s3gh5dZUoRjZNVEB4FCrFbc5q6kwmNBmK4DqguMLphOCpq4wn/1sIme91v03HDissDDbSmY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8094
X-Authority-Analysis: v=2.4 cv=dPyrWeZb c=1 sm=1 tr=0 ts=698bfb69 cx=c_pps
 a=qSo88s0AsKk38onbse8luQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8
 a=LK9VBhMjcIS8r-AqFPMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAyNyBTYWx0ZWRfXzRdfi0TQ/G7T
 Gx9iedsYq/vlxWnu6Kg3jeHSH1kHRBwcTy5RaUT9beqZTBnIijkHVO8SfWdgouIQ9vLe++SZ8XQ
 giBhFtrVhT5/OiBu6wkLosuIa27o9t9S6M2lsMC8zlEwVHf0L7v+8pR904qeZEIGaV202m+/Feb
 IWwLdWEFyMFO3Fh5qE81f6IaNduvYQsE4UoQRgsWF0TOz6sXh8rO3uAo6A7VS6wlDNCJCtRFsJD
 vCP9kePE4PGQvZ+v6iyFMie50J/HI3jiaW83y+kd4K+9q798j8D5w3UKX5ZBL8Q4S40MBLBV+d/
 sguxpxXJTANZtH1Ot3B58zmiYAeJ29J1g5rO2DnrG6kRYFTRgt0y/vS4ZhPsd1XjdTD7u3mZfM9
 olVWl+tUI+eAGxE0/FvZFT4rSXyRofsBxPMXBA6tpMOhp7WoHC8+bccetSpNu08oYsgdSrW0Kl1
 DXEmp0+48GKJafIOKtQ==
X-Proofpoint-GUID: os7rxAp22qw4UToZpqBmNNHcTKYUwAQt
X-Proofpoint-ORIG-GUID: os7rxAp22qw4UToZpqBmNNHcTKYUwAQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110027
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52550-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,raspberrypi.com,kernel.org,broadcom.com,xs4all.nl,linux.intel.com,windriver.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,windriver.com:mid,windriver.com:dkim,windriver.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BEB06121100
X-Rspamd-Action: no action

When a sensor driver is unloaded and reloaded (e.g., rmmod/insmod ov5647),
the cfe_async_complete callback is invoked again, attempting to re-register
video nodes that are still registered. This causes multiple issues:

1. KASAN double-free in kfree_const when dev_set_name tries to free the
   kobject name that was already freed during video_unregister_device
2. "tried to init an initialized object" warnings because the video_device
   kobject is re-initialized before being fully released

Fix this by:
- Adding a check in cfe_probe_complete() to skip nodes already in
  NODE_REGISTERED state, preventing duplicate registration attempts
- Implementing cfe_async_unbind() callback to properly clear the
  source_sd pointer when the subdevice is unbound

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 62dca76b468d..d3813c79316d 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -2152,6 +2152,9 @@ static int cfe_probe_complete(struct cfe_device *cfe)
 	cfe->v4l2_dev.notify = cfe_notify;
 
 	for (unsigned int i = 0; i < NUM_NODES; i++) {
+		if (check_state(cfe, NODE_REGISTERED, i))
+			continue;
+
 		ret = cfe_register_node(cfe, i);
 		if (ret) {
 			cfe_err(cfe, "Unable to register video node %u.\n", i);
@@ -2204,8 +2207,19 @@ static int cfe_async_complete(struct v4l2_async_notifier *notifier)
 	return cfe_probe_complete(cfe);
 }
 
+static void cfe_async_unbind(struct v4l2_async_notifier *notifier,
+			     struct v4l2_subdev *subdev,
+			     struct v4l2_async_connection *asd)
+{
+	struct cfe_device *cfe = to_cfe_device(notifier->v4l2_dev);
+
+	cfe->source_sd = NULL;
+	cfe_info(cfe, "Unbinding subdev %s\n", subdev->name);
+}
+
 static const struct v4l2_async_notifier_operations cfe_async_ops = {
 	.bound = cfe_async_bound,
+	.unbind = cfe_async_unbind,
 	.complete = cfe_async_complete,
 };
 
-- 
2.43.0


