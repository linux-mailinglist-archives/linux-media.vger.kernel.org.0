Return-Path: <linux-media+bounces-53073-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM4QFdGnlmmTiQIAu9opvQ
	(envelope-from <linux-media+bounces-53073-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 07:04:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9BE15C499
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 07:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC244302768F
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 06:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D26C2E612E;
	Thu, 19 Feb 2026 06:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=q.ai header.i=@q.ai header.b="YwiQ/VnL"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023121.outbound.protection.outlook.com [52.101.72.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258932E2DF2
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 06:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771481034; cv=fail; b=akEjNUqS6U1B9JIhwzv/a+7EBPnxBuPOdF+chXDCkbeKzb/t4iKQoWQRQsmUBkareA2+qntqNY28SNpV7GmjEV5WqstU5DjYV46RS8VVNd+wZaFhTyBCMNzIrVC/S8hfv6j4hM/tFxc5/ixF3P9h1JTyD/Jbj5Vc982TO36GaRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771481034; c=relaxed/simple;
	bh=hNj3BjwRR8/Kjgv2gg5TCsSRqTE9QXI3zwTRcGPYxQY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jB+lZWyWYXi0wugM5ZIniUTXmqzVQ+403T4/xJvx0bP7GK+FmefOp9izKNsk5Wg0tOfKeTYAjCbyHgXJbVYfLPsYyL/izBGljoH+kiwKuW0fH7nZI1u0kVQhiwzBKV90BgOX4/393/LuA9emiQIpH0UASfKgci9nrbXBDrIPWmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=q.ai; spf=pass smtp.mailfrom=q.ai; dkim=pass (2048-bit key) header.d=q.ai header.i=@q.ai header.b=YwiQ/VnL; arc=fail smtp.client-ip=52.101.72.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=q.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=q.ai
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H50EBBHE+yV3dDOg8qS5mih8/8nN8Ihwb4AfnBn0KLndxfl2gSJTKsyUApb0zgtDEPm/wYrET7xF+1pGDQd6defqHXA0iyW6rUIGgBO0ytPAyNT2KpEP+2eGNA4fWarQCfgAwTc11goR7VIvTdtRw41ftgWKxUDydzI3/XdmGeyb5QbGS5+mp3Lc8GgLmGYTFl9K/a0CxaJzemBWFzz++D9JvDkJ5WXpSYX048QFROUOa54eDeGizNeiycbbXl78YtWwVQ5VzjXkfsynYMHZCAOaGnH0r7IOsB/64nsl1d7Vch8UpSU/eXR3qAuuBpDLeA0q3AQxeQDqNh6vn/4l3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7N6eQFLR0gqWZdUVZtwJtAOVtoK4FclFOg/prH8uaQ=;
 b=UQpPCCv15PbApqUBSe/2pYGpbcD9eh37dfGUY1yF3GapYfrOeik+wnmi/VorGvuhvZOEA9oXvx4ZX2T9ZiuAqagHyUftftAhkCzQSBQdo2UZrSgsQLL8IuZpBot1cE/gDl8rKRg0wCkIebmTjg0uFFVSzFfMYJOL0QFRFLISohymlK0+c8NkM+fQM8jGBvA+ZjhWvq4WT+o1UR+ZTvk7u2RIh6rYd9XoEG1QcGi/hztc9c0NLwFXEx8p4Gj+st4bN97RuJO2sAem2Fb6IQn2HVwe1oiqwgxgGXWmvUoGHbIhqaUEHPnWt+KyGVjZ/DWvjnrj+m5I7oTvdwqs0LlL/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=q.ai; dmarc=pass action=none header.from=q.ai; dkim=pass
 header.d=q.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=q.ai; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7N6eQFLR0gqWZdUVZtwJtAOVtoK4FclFOg/prH8uaQ=;
 b=YwiQ/VnLAEOrXbSp29OClRc+GJKCz8x9+RTgbrKJOPkpQbjS3fq1eFgQvIQOoH843KxyjDdgeqqlVXybx+8uZL+8CbpUgbxbZODdSvfH+sZ3XHgzMSljCFffIziJsTOaT/yI4yRn1JS8Nq25T216wzss9OBMLjZgaxkoWujR29d09Gi35Mi4poCK0fLKH1UV2Uons4hTDXiJO3kZZVhHZIzpc+HRT4PkCpPWa8c7sdnE5VUWZY9uBhi1PUQBN7XQq0RSbnumesXG/GD2oM4rrl0nUq5BujzV7SssP1cSZohCm7N/QAIawbTcOPNKrrZPF+tFp7XMJBo2KLqeq8aGTg==
Received: from AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6a8::23)
 by PA2PR10MB9133.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:421::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 06:03:49 +0000
Received: from AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b928:6ac:a43f:e736]) by AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b928:6ac:a43f:e736%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 06:03:49 +0000
From: Itay Perl <itay.perl@q.ai>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Itay Chamiel
	<itay.chamiel@q.ai>
Subject: Re: uvcvideo regression: loss of access to full UVC payload header
 for generic UVC devices since 6.17
Thread-Topic: uvcvideo regression: loss of access to full UVC payload header
 for generic UVC devices since 6.17
Thread-Index: AQHcoMQ56VCXsngA4UKzyfhKPmFOcrWITsiAgAADThaAALZugIAAMu+l
Date: Thu, 19 Feb 2026 06:03:49 +0000
Message-ID:
 <AMBPR10MB9376A5762A4DF0BA3759437A8D6BA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
References:
 <AMBPR10MB9376E972B02F45815C729C318D6AA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
 <CANiDSCtPKtKr7UgEj934BGpV0NEvyHbYcutMV_umBa=JiCNDuw@mail.gmail.com>
 <AMBPR10MB9376F52A5A6C5EC76EC263CA8D6AA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
 <20260218222211.GE57525@killaraus.ideasonboard.com>
In-Reply-To: <20260218222211.GE57525@killaraus.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=q.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBPR10MB9376:EE_|PA2PR10MB9133:EE_
x-ms-office365-filtering-correlation-id: 95183a7b-8188-4b64-8496-08de6f7ca6e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?sXn6Bw0yqvOzp8DsOqVaXcbUtvnfDtisuWhh1iXH9M8BclsnTxsxukVaPE?=
 =?iso-8859-1?Q?gLmFeNbg5w86JeJ8zxGbJSQIjl+Re2ahhmXzFNBDr/+rjcxL5/yF+Ln3c+?=
 =?iso-8859-1?Q?Y90jIyyV655VJRiI6cyR9/DEXDR6y/dONIyeTmGz5wRpMN12n07iR7Xtwi?=
 =?iso-8859-1?Q?jve5DfUKddGCJtZvTRG72uNAkCZcysDtnIIc0f8kn7K8SGaPFonUMFv8eN?=
 =?iso-8859-1?Q?9Ncuxvcp93nkYynGIYi4B/ns9qaqrAG3/5HWZEBHhw0UyGlardyTGu1/ea?=
 =?iso-8859-1?Q?wKTd2+tuDeI9dN7CxLmzOMNiyMRYKe0ovfehdCLIz5RyYgplt+Bq5UhtQ/?=
 =?iso-8859-1?Q?oeqhhbVhBTdo8zwxsuxssG92qIHWjoS5FP+BU8+C2KrrFtjoGeK9C5Dy0D?=
 =?iso-8859-1?Q?zzv/WYHBY6nhF1w1x/1YlohtiO5jw63IEn3iHScjJLRtSojfxw2CaJjOAv?=
 =?iso-8859-1?Q?/Ptbqcr2kqdhOsLmy+1ZW8DAuxFWvAhBClq7OMdwo5TO/M/kI1aEsJ14fl?=
 =?iso-8859-1?Q?c23uJz2Up680VLICoxHlHW5hgopXEpRzXj42HdrU8u4vVE5OyIIw+WSUyh?=
 =?iso-8859-1?Q?KEiAS0mAWvh8SofDWyNBwGP+hjxxL2Aw3B2w99f9XN3vJcJozMyAu6LJl8?=
 =?iso-8859-1?Q?uLyjbbic5kIVikx/7NSwNcT9esxNeTAqw5BMg13Mec6VW16i4O3yd2F2RA?=
 =?iso-8859-1?Q?Z7ttCWOFrksC5HaUn1ztbmciXr9Lx+BNYm2zutsZLKG070s9xa+aLJ/NWy?=
 =?iso-8859-1?Q?oy6FdHwunJSFvR+zcZQww+lK6G6FN3vjda+JBEd5Ri7VEZFuSpVB1Y2+09?=
 =?iso-8859-1?Q?Nw1pAzppvi/BwPnvf0e4V0pH3JIlOo9fcN+dhXCi4LKDJbREHPZEvksGtz?=
 =?iso-8859-1?Q?7VgpYImn8QsfkvWigW6S/nZfdmLLEC+S4QxFRykA4BCZ+/RoOzxvcLPbOc?=
 =?iso-8859-1?Q?/EPsrlFDj+npfT+veEKGlQ2CaVAwGQ/NKAnLCAW5JK0iLf7qhkGObbjLzl?=
 =?iso-8859-1?Q?wHTVV3Uo40v2Bugyh4RiSpfykx545y8iEbulV63DZa93lGejw7j3Inv9EJ?=
 =?iso-8859-1?Q?hpeVO0HhonK6I0ZUx11336UVjMwl8Ic7Bn5rOvvhUoWHCCrPS2E6kLdKVI?=
 =?iso-8859-1?Q?x3Q70aeW9tv61D3PWWmvf51/cYeMcnrz6wSAyvINDw3kFi18Ak+29k8rnj?=
 =?iso-8859-1?Q?m5hkL3mPn+4YN+S4oamNDZvcbQf2XFBD5Xcrzi5ruCooDzhih/PhKlpxr3?=
 =?iso-8859-1?Q?FS6MFDY2fXPpPvvGyIlKUaPGHboIQBYdmLpGEfdNNdEf9cftqnZCwNefZY?=
 =?iso-8859-1?Q?+qO9Qm0GOIG8pAIcyUR9VfgRxrxveEvBaVDUclT7/3oz51BxiNj2u8c52N?=
 =?iso-8859-1?Q?8kPTeqKqtFqY8CLR7Yue15s/l/d2wVup32z8cGCAaWZqhZ6jNrz7o6UwGy?=
 =?iso-8859-1?Q?6fcPoioAZV+9VuKe3V5M94jQhMjbcc1ltzWL0iG1otCKm8/q16JXicN2pp?=
 =?iso-8859-1?Q?VOh5qCOFN8Aw3RtyNwCT0CuwvZRW5dvlmh9sJXHy5gdsCq0VLKGAWjxGik?=
 =?iso-8859-1?Q?IpfNa6h4YOJ1/GdgHBfaZWcdY6/7jgYfDYiJL2ajuZiagOVArZD0R5St9A?=
 =?iso-8859-1?Q?kT5HRubbvb1F6qfzX0aTsKbhEZzt+YC7m/xfJbl1xXoYNuwRK9JKaoxsdK?=
 =?iso-8859-1?Q?j4rv6l8Jq1Awvr7jhzA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7dGByLvIMa3yyju0WLjzu+enNXVD6JKcvikSdLGS6MGYIk47ors4Ajyxla?=
 =?iso-8859-1?Q?gq1ERIEo87bveV+03BNmuho4OutsTNHgb5ZsUNNwez4WumW4WaeuYVG03d?=
 =?iso-8859-1?Q?WaflrxxXfikHy8AoWsXRA+ls24VXzsAZGzh8DCY+4Y/3/5fLFB5tfLvMsH?=
 =?iso-8859-1?Q?rgGcS0BXnFY4/OnITOmOzH9+GSME/5f0ZIDs8w7WCmczuTBbMq0Oy8z5Cw?=
 =?iso-8859-1?Q?22rQBOmsv1XLnArxYqXqEUtrrVCApiQHQIO4PAt39uU97zaoQHsVKMQw05?=
 =?iso-8859-1?Q?LHJeJNGrum8BHwzRZ/4xMHK0hGiYBs9GEOUzLWFJABAziLsuBp5gunujSh?=
 =?iso-8859-1?Q?WsqvA5S36+LwP3/4drTZ+hFb6PJc2KUmEyexiK6wQShNK6dNAFrMSipTaq?=
 =?iso-8859-1?Q?aPg7hwjPW/CvTzCzW88be5/i6NNiY1xZjCZzty9kLKwfxlTg5/FHgIqyIb?=
 =?iso-8859-1?Q?OR9J7aLV3ZoyLFHjJdYpH5ye/hiQPNZLFDj7n3g5OMFuA5Dll82Tq6q0lC?=
 =?iso-8859-1?Q?TIlR11dWQB6twc3i36jIbR74wQe6nXtp6K9oknZILOmEUQXCoGbvtCl58c?=
 =?iso-8859-1?Q?A43BAFj/mENzsh01ZtUMj03sP1bMidXBcDfqlwpTJ8hogH1K3rV2Jpupt2?=
 =?iso-8859-1?Q?ktP1NQaReN6aOZfAQZBYGUOpLcYqHnnhRobbXSnEWD7+CMxYjiRgVlzInl?=
 =?iso-8859-1?Q?Mlhz7SqOJk6BnrcRAE7+wbAyAh7FV9hiWYPEEFgvTyyK2ypI4CAsyaMCWM?=
 =?iso-8859-1?Q?r/bl2rOPUgSGHTM7aBUeO8hKJljjhS6vJrK9a+cXhgEs0t4AAD+IIaNUcz?=
 =?iso-8859-1?Q?TfLGtfx67hxPnT7pNizlwrbZlc80cDDOB/rFCUSC1uZx3PAsRSWQ2bfyW4?=
 =?iso-8859-1?Q?hKxpwf7A4onri7xY/EsWHGWKLvPL4yCqJtdgDeSgJV8nZm2Uu1r6Q0NjrT?=
 =?iso-8859-1?Q?feInF0j8m01hIiWz8LnkPXap3U6xftcaHLZz9sJZrIQ3MqijKTseefKeR3?=
 =?iso-8859-1?Q?y/2HH2j7McYYr+CZPUgQArfcXB32gSexCaBhkSme6DTI4lMOQlESlxvdWW?=
 =?iso-8859-1?Q?qDncLyoBK+uMD2AhX31niV6bDu8aOJ6t+cB/UZwHFv0oiS0Bt+myKopDo9?=
 =?iso-8859-1?Q?IHJGQqpo2Ugt8JnCnNYI77bsr4b7CCkAMS72EHJGRzlGa7XFoh7JI0MYBN?=
 =?iso-8859-1?Q?xRngX81vRblzDsiD0yVy8Q0DLT/hazjeBD8Ch5iyBk977xN81tGaW2o47v?=
 =?iso-8859-1?Q?vOl+GIkNHbBworA8GaVrd8/CnWsQuq/TLzmUZAYX3TRaEcgROhK7WlphVW?=
 =?iso-8859-1?Q?rGDKd/l37yq6Wu+Uctqvp7vC8BfO1JGWL51Bg9yFUJxmnf8Z2n+Y7GFe9x?=
 =?iso-8859-1?Q?+zDOkHJiQtKg86zVpFOoFN1QFzYD7VvaBdX1uv5sBRuz+RavTZKFLt/+mt?=
 =?iso-8859-1?Q?8y9qNymLUDgmM+KiWsb9H4KtoK2m2higVNdfHZzXv5W98gMDZKtYQDZLBS?=
 =?iso-8859-1?Q?UqTbfZ7RyCEE6q359KbxTbL7prhSOxL2C+Q1muLgxIhvPTkzvO1W7aO4MA?=
 =?iso-8859-1?Q?FHQPJ/zviqn2RP8bPRIfbv1RhgFocwAAcUboGfX+Lsw2Ub5q0SPrvztSTN?=
 =?iso-8859-1?Q?9rbbiDgCaPbNWc9o/eOhyz1aMX7cg1hdOTiFxLMtdvjzA7glhsOSCtWIBM?=
 =?iso-8859-1?Q?vieNonXJZAXBUmC5ZR6QgGrXgvUY9MogRZ5WdSnAAu6u8AdrYEVtpiheKe?=
 =?iso-8859-1?Q?QrktqD2Fma+MEesrJsoclqGZZxlT7pWSXUXNX8l3l7+zbY?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: q.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 95183a7b-8188-4b64-8496-08de6f7ca6e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 06:03:49.9376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7aac50ea-5b23-4e88-8c1c-f6c7ceede9fc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Uga9Fm25ZunGpurhlecM9qZ/4oEo+jzzD/oAmHewIaODTHoma6Rwwe6A5Jv/+hY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB9133
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[q.ai,quarantine];
	R_DKIM_ALLOW(-0.20)[q.ai:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53073-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[itay.perl@q.ai,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[q.ai:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,chromium.org:email,AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: AE9BE15C499
X-Rspamd-Action: no action

=0A=
=0A=
________________________________________=0A=
From:=A0Laurent Pinchart <laurent.pinchart@ideasonboard.com>=0A=
Sent:=A019 February 2026 06:22=0A=
To:=A0Itay Perl <itay.perl@q.ai>=0A=
Cc:=A0Ricardo Ribalda <ribalda@chromium.org>; Hans de Goede <hansg@kernel.o=
rg>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>; Itay Chamie=
l <itay.chamiel@q.ai>=0A=
Subject:=A0Re: uvcvideo regression: loss of access to full UVC payload head=
er for generic UVC devices since 6.17=0A=
=A0=0A=
> On Wed, Feb 18, 2026 at 11:56:28AM +0000, Itay Perl wrote:=0A=
> > On 18 February 2026 19:17, Ricardo Ribalda wrote:=0A=
> > > On Wed, 18 Feb 2026 at 11:59, Itay Perl wrote:=0A=
> > > > Would restoring the previous behavior be acceptable for compatibili=
ty?=0A=
> > > > Alternatively (or additionally), would it make sense to introduce a=
 dedicated=0A=
> > > > metadata format that allows userspace to request the full UVC heade=
r for=0A=
> > > > generic devices?=0A=
> > >=0A=
> > > By any chance the device that you are using supports=0A=
> > > V4L2_META_FMT_UVC_MSXU_1_5 ?=0A=
> > > If the device exposes the UVC_MSXU_CONTROL_METADATA control, that=0A=
> > > format should be available, and it provices access to all the UVC=0A=
> > > header as you had before.=0A=
> > >=0A=
> > > Alternatively, if this is needed for a specific device you could send=
=0A=
> > > a patch adding the UVC_QUIRK_MSXU_META for that device.=0A=
> > > Would that work for you?=0A=
> >=0A=
> > My device is an internal development platform and does not have a publi=
c VID/PID=0A=
> > that could reasonably be added to the driver.=0A=
> >=0A=
> > I may be able to implement the MSXU control on the device side as a wor=
karound,=0A=
> > but I'm concerned that this could cause issues when the device is used =
on a=0A=
> > Windows machine, which may expect the UVC header to follow a certain=0A=
> > format when MSXU is present.=0A=
> =0A=
> Does your device implement a vendor-specific metadata format ?=0A=
=0A=
Yes, the device uses a vendor-specific metadata format to attach=0A=
platform-specific data to each frame.  This is the most straightforward way=
 to=0A=
add per-frame metadata without otherwise affecting UVC functionality.  We h=
ave=0A=
used this method successfully on Linux (using the 0-format hack) and on=0A=
Windows, where it required a registry configuration but was otherwise=0A=
supported.=0A=
=0A=
---=0A=
Regards,=0A=
Itay=

