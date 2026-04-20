Return-Path: <linux-media+bounces-59120-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBcUFPbR5Wl6oQEAu9opvQ
	(envelope-from <linux-media+bounces-59120-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 09:12:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FF0427A09
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 09:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBB003011787
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 07:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4B638423E;
	Mon, 20 Apr 2026 07:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0SC5tvK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E7540DFB6;
	Mon, 20 Apr 2026 07:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776669164; cv=fail; b=OxGqL1iSKu0ntpU6RdhwC9Fizr4FMJXNcyd3jBYtu0cAwJ2aQbmOe1yBds5GY8GWk+lk0jJeItZ6qiHDuLoYlxgxmtSQaZXHYy1GtmoNKO5yD0W1gzcxI8SE//jymzqNk5ZSTyBEvlqQ2wUQjbNfoFuZg/Xg0nENZksfTA5qa7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776669164; c=relaxed/simple;
	bh=4J+x3gUkc9bnTdGertTS3SjklXXqLiqQOml9lufyHpU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PwOecEOH4gtTL+wdK7OCgAZXusIPG5NDuhwj7cFvTyErW+bWY3FJlXse5A8EZlV8hyLtQ60CAMDPhobvmX2P5Re3x8kQi0NSOBDYchcll0Cb9xRElLtH3tXQmX6RGThhaMPWjKGJRnbvkQC/9HJCAVH3p22XEqXdUYZ86nIDxkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0SC5tvK; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776669162; x=1808205162;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=4J+x3gUkc9bnTdGertTS3SjklXXqLiqQOml9lufyHpU=;
  b=R0SC5tvK1uWqae0jEZdQ0e3zQXPzIdjqbqaAWlzGLojXRouAl+tdRe1b
   VresTxcfKnE3Jkf8sPWdZhUxACtGXfwHHl9alEsuLSDvyv8Tn5poOIs8W
   vMYnejAZpUyembNs82yrms8mK82Ycp1ib78f8oaUSVabojmut8T0cu5zQ
   3Ts9UTb3LmTlGVOfkmldQaXMQH168rtNd7VAM14S6tCQ8vpiH3zhDSJ5f
   EvsF4b/cAwN2Di7jwvQ0YNozkz10Lrk/jSM2g2JvYWkwixNrAnujSF/UI
   U1FKpuaIqSz5EVOydV6EADZj8FnalmBi9DAPiL7LiOooyV6ixqOBay9WT
   g==;
X-CSE-ConnectionGUID: dxrFs0E3RDmqbKjAppaewQ==
X-CSE-MsgGUID: 1tr7iaA2Qiegl4mU0jafAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76605620"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="76605620"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 00:12:42 -0700
X-CSE-ConnectionGUID: /W01fvGzTi6hpWA51GWfoA==
X-CSE-MsgGUID: CeUOaSQDRrGjtX+yNKQfag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="262026941"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 00:12:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 00:12:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 00:12:40 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 00:12:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNXuSzHAy791k10Sj72Oc6bCL9++X4dSJitp5ZwyFKbcgIw87GU8/OR3sI8KlSNP8jA/67iJO2k3pL9AGgf7vFRLB56XyT5hdL4mhmhbB81VTPk8K/H9yPpDQAw2oFJXUVhcYMSPRsDYuD2SKfCANx0OZuwWs1ZeXqdpY7TIYtTgJHAdgxHvhYlYpDm+mwYG5MYhaL4j+CknO9tOqlUsnHkT/FrTPv3It472rmQAD4//HkqrdLBwiflfPSpw0TEnclybYsEaFT2SSh6Sl1bfaiypluq4zistlNb+z3GLZmuvw+9gr2MkYNNwM2xdZvYyScQeqshzy7KzgBJKCY9qhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4J+x3gUkc9bnTdGertTS3SjklXXqLiqQOml9lufyHpU=;
 b=TLEh9Nz/IQ5wKbmLVY51AIyD3oh2RUqwHa6yjPVeTDV+yn8u+MpxXNqbzUZCX46VK/WPccqK9NWJUhZk+Q2nFYyN7eNWmO2wNQdVZ164xDpyhGga0WBq5gISPVBqZ3oZqfDe7pC9z09O8hMTedMYOkOTgfAFY+O+0JPA1UiRDf7V+JuFFVFj0k84hq8tHVHPAW+6eysKhv4J3SduzJG+g1/IPSQVdTswBmrLYMXzt6YmiPwKtiKTZARp81TcAYvZWATSbeOKFVwprQxyOP9HJz1+cG7BzvUxJAg/kyTBUznccU47CfPHyJwtGBu5+pPCzdl24O998GYOh1e3Nz1qYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7971.namprd11.prod.outlook.com (2603:10b6:8:122::12)
 by CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 07:12:36 +0000
Received: from DS0PR11MB7971.namprd11.prod.outlook.com
 ([fe80::40aa:a291:4c25:6e0a]) by DS0PR11MB7971.namprd11.prod.outlook.com
 ([fe80::40aa:a291:4c25:6e0a%3]) with mapi id 15.20.9846.011; Mon, 20 Apr 2026
 07:12:36 +0000
From: "Yeh, Serin" <serin.yeh@intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>, Kate Hsuan
	<hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Recall: [PATCH 2/2] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Topic: [PATCH 2/2] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Index: AQHc0JUQ8LBwUnMjOEWVVkHVN2QX4g==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Mon, 20 Apr 2026 07:12:36 +0000
Message-ID: <DS0PR11MB7971219F936B084811AB921AF62F2@DS0PR11MB7971.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-traffictypediagnostic: DS0PR11MB7971:EE_|CH3PR11MB8414:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0f698f2-ac41-4844-f1cb-08de9eac3366
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info: nX+uXnKqJNttNQ+h17wvxkJcuGng3fIjRhLLl/7hzlmz2rpQHEezZe92LFbrZ0E8lkJqEG9bdAjgEKpTzRm2ZgsYcgFy0/6SZimMEo8EzpKG6pshoigPR8k3WejD6ut19q0GaS7INAF3Syif/4BqNoj/rvnKvhFBuF+big8cpERdSKSyO17C34M+7vu5XXQLfVRK/kHufOz6dZEjOuhKx94+LQcv/E3bTh6uLpsPpbv/le4ajEOZRhmVgDCQxSXoPGQozj6+MY2lDlavq01FXUsZU446Wt5LKXVtRT4I7r1MHubO8QWM+w2AxP2WabbsZ+IQemJ5QUdwvO8fjePZhzLz5uKr33JRoRVni3WGIeOAf1xQuxrkhsQUK4nGloe5wEt8ttw/oALnzOSQRJLivVUuoGNSk9O9b9XrDjIO4Hyf+elU80NjTDzaZnRnl9qRlw8N12NIR6gsI4uodmidR5biQy3qJgwTP/X+534EMDyNkijsPLw2GuHkw2qg/qPmFDLDpGmjCYiAkO3GHBxXT/fGflcvM7F8KKB/1NCPSpDnj/vEBRaY3UfYg6XcCJa84dg/PJ1L3iR2/SW4/p7U1tUT6lf7gG1/kOl41mxYtekiWibqi5jjKVcs7WgPHTmK+4/pSDCIlaSETiubUabZHpnCv061Ny+R+7YTRTIuyb8nGxgWXHj0jlRyphnhviSX6yRnt1HLqyaSp3OgVKNYeHxiA7paueRQqFbqZAOWmG2bkesUhs53kfm5G6wi5QzV9qPdumnRJMbuNcm3NcFERMega/C3+OplD1U1A7ToDck=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7971.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8OBxWh05y5HtivLb9wgQdW4vXQ4szuheSolfEOzK78GY96cvSj511D2S3MaI?=
 =?us-ascii?Q?eD/cJt6uNFIHpIb2K6Bl41OZTVGC11uiJs3MdXdwXGvqNXS2PBzEi9VQdVPm?=
 =?us-ascii?Q?cVZXHy0JXbf7Qv+yPsFWeVhUTJZbMc2opmdxjpM769dOTS72UGYlRtLjG2Vm?=
 =?us-ascii?Q?OUweOnxW9/naNIB8j54ta4oB+ge1ftRUu2V2z8BfH6kjOA2iMyH9gTzSZbQU?=
 =?us-ascii?Q?vkIUatxrFkvv6EiRVHcHGpS/U0UMcmZZexg/xB5hnwyAZa1GvjHefpv5Xzn2?=
 =?us-ascii?Q?v3SFQmzVVO2nmsZi79SL9HSENwhBbH/RdgWHouaDVywbJvHhkIXFuK3qRP0Z?=
 =?us-ascii?Q?ynEZKpp76kyltQjgp6LSTcDgtExVsrIDfLFMRoblket4+02378smnj1iLzbo?=
 =?us-ascii?Q?3xdmHkVwPiGHmFqpkJ1u0GuD4QZtWEByviLDmPkfiiTuVA9RRP6m4lqFJYCb?=
 =?us-ascii?Q?sEnpd0enM1cgigO1TeBXdxD8cTUnDmbtAKWX+LnEFtBhB701XftrMVFPljw5?=
 =?us-ascii?Q?E7dXoOG5iga9uuebPa6hwlJ2TFzMqYia0bNJgBZM9W2cVXxYyZ+Po82yC16n?=
 =?us-ascii?Q?Xc6ozBHjmsf470O+MJoDYByHPfglVcCxv6XHmimefZmcBulDHFGWM2dsjmwX?=
 =?us-ascii?Q?xGpbI/GZb7hGfMPdAn2DkpoI3431KZqVXnESNsF9KErnWfNTvaVng+DMoPRG?=
 =?us-ascii?Q?UaI0KQ3SeWZ+bH2sUjmN1flLVPM54wwaQ/hfHQ9z4h4SbGskohsOWJ3z1VTE?=
 =?us-ascii?Q?sOXhFszLXkoOAx77vWVqO7bGeoFyp9PTbIW/Av70GRdYzLDvokHE4Cxirq/y?=
 =?us-ascii?Q?CgeBfs0f2sxhlsUuOk7Bp4O0d2hRnAPNbjzdmtrf3cm1JlsTPv4oM37k17SY?=
 =?us-ascii?Q?ZmhDzsX5xTi48KST807DZjFJEidnwnH7q4WQvtB+b73GsdbCw0E4/myp5w92?=
 =?us-ascii?Q?cCcPZvfDl6iEKSRXf22rEyUSF87BZxUqyPttNCDGGBHdatUVfg8VHg79mxmf?=
 =?us-ascii?Q?Wenpr7WfUf2Y18TabH8gMIMQ3FUTZleN/GU/GCWc4m7PsYzJy+CFRDMzqFmY?=
 =?us-ascii?Q?gW8g9BfUNXvCn1Nohn9WXxofjaKM3fe70oN3wcNHo53sdKowYH2/HgdEPL+K?=
 =?us-ascii?Q?2Q55TE64Do1uTQIuv9f9yfzIvWz/1HzaUHV8UcpCgIQpbPaIiSH3/iIxM0Nw?=
 =?us-ascii?Q?N/C7NpZhJ3XPcWRjlv8tE4dzfCo1ipd/l7d8gqgCL8CVTxVViJVdPvUnnLZT?=
 =?us-ascii?Q?qh4SU3qRxnjAhCFMLN8UnKiRM/8On2KRDMWmNA06nnniihN6TcKF2L0gt5X1?=
 =?us-ascii?Q?waPfoLwd3kCgnLVW3Gg2tl0LpkffT+D3PwYxXJGduy/phAVveQd63wWPRIDb?=
 =?us-ascii?Q?+ZuBchRCmExLNPuxeFUM7OwGNdoa2zqpVCDvxocRetnsLR//r2zBnanhdwFw?=
 =?us-ascii?Q?yWmEyZx+kyVbETCKARrbNlhhGd/LwgAR3M6B090RzGlxa3OI00/biXAdrXx4?=
 =?us-ascii?Q?Hn2X7RY5MIbgSIN4b7wLfQB133psf+Kl5FVtPdk6jjq1x5kM30Sz+Vt4wN8Q?=
 =?us-ascii?Q?2d1LJP9uobMmi3ydqSQmIzn2jimuwzOOZxXqO3qTiKHU3ZkRc55ISqBpkZIH?=
 =?us-ascii?Q?8Na7ZJabzrEZkH1Ch7MFT03R/PYcdwqywKBXPdQFWFNiESW81qywZlFiWVsd?=
 =?us-ascii?Q?z5kCQp3niQDRMTFNqaSaTMVBdUQnePppNC+al+A7ebPjVdfabtq64MfCVfi1?=
 =?us-ascii?Q?CjgJGCHvIg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: k7fRJm+8642ScO/JveyrDedRAQ4lF/nEKrkevjUIQB6U86LC49D3EmJgqSJSuwbBIdlOjO3YAfLX6xImwV9VBMSgdT+OzNOP5PoPKQN2QE/pq2oaX6Gt/SxD3dApeQBMaSmvcThna52AHIhCOhdZBP0ngHbGPkkm+NN9XKwyJ044GN7CrIA+IBdwE/ek9RK02ob4p3XtzD9TkQg/84dbKAZlpGmWN4EteqceXCSdL0F0y1SbLPFdvNW4gksSrqF1DfYS1FfK7SPEuBmb0MBC8+Jjv6YbItv3jt8oB6W0T6j5YIWazm1KnV+8Khzy+VglO+v0tNaiT/fTS8ld712FAw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f698f2-ac41-4844-f1cb-08de9eac3366
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2026 07:12:36.6870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A9pnVUzKnT/OdQ2HsKdL6RWz0F1/9cBMMtNtN3Qt71rGmlm9mN/cJH68r+wfPsku4rtbgyUaMYUrn3PDcw7gdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8414
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59120-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[serin.yeh@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 50FF0427A09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Yeh, Serin would like to recall the message, "[PATCH 2/2] media: i2c: imx47=
1: Add Sony IMX471 image sensor driver".=

