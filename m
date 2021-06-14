Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB253A6CA4
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 19:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235314AbhFNRFj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 13:05:39 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:59536 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235298AbhFNRFi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 13:05:38 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7BB5C405A7;
        Mon, 14 Jun 2021 17:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1623690214; bh=oVe89+HKNvCKWq/SpESThjtUBJtH1f/3t04jaVbJWhE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=YU0bq/J8q9R9VhBZa6ZCDsn7LSaXbI4lcUzJXyRVR/EhV3nATkxjzT1et6EVGD7aM
         ugIza3O7rx55CVPVXZzADqwsQpi/ymtNqNUm+i8dTpc02Qm++HjGC9+jPy/lCqJYA9
         l6+ynoGKzYiy07UPpEgngPJiiEMVnnhBez3p3ctoxwAD+Rmo6SCuuNr1aE7gVoGO/r
         lq4kASEddmw+94rrIZEoAegH1+gZ/mSFZ/BuA0wCNWCCL+OErtxIZsqLCdoHwGcpxM
         kc/QpJ2tPZv1gpq2zedzHi9sO1QZrG2P9h+xf3eorBonw9lKz0ySi/Cs4tH2h5fJel
         ZDFteAIyy4oBw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 9F480A005F;
        Mon, 14 Jun 2021 17:03:32 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 91CAF40154;
        Mon, 14 Jun 2021 17:03:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=nelsonc@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="UjzaKE3A";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwgdl1ZuFWfYcCOf/nKfDSgetZg9npKUUBJzWZPxX9yZrc9IZpowvum56oGxiE3DqGU0oqp9XwoIWFEWt11ioymdfepV6bCmVUtjl+hXcIAsy58AoXs86DRqTE8g0ytyz8yCybrnkzzDklxIznGcq9Eh3h8lITOGgYyyp9kR8OYXdLVJJPywpBl998IBhFFsKxD/lQGdfVoTdkGyW/2wc58N+kIc0qkPMiCEhlz7q0GS2dlBhgAhw0VYpeBPzqVHaJD4lKbjSgsnYIy8ywncHFhMPxj7syl6FTrPZ7fAgBlte33XyFXG+FOuvofYp/QajzIrqitETgpNnf5XmR4Z8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVe89+HKNvCKWq/SpESThjtUBJtH1f/3t04jaVbJWhE=;
 b=EGt5rrSFPaGHDLiG26XO9UWvB8smpd2hcH0gs5zxNvqRdSGEUwn4/ZA69ZZSM4dlMaya1gwLvVb87phJ2csjrYjmEOnecOVAARqEs5ZzzPD0D10/d2De1zjOewIyt9+rZpoH606etlZEWYrrlCKIc/yqVFDTb0+iUmsU2Uqqc+SYqf/9EF1h2486DB6wzJZMYUxvogNJjhm/hQsDSBhgHOc8STqC795Iweo2wlC7KohgIR/ZbGNSgUcDvFrOVl5sk4Ok8K4EMLe8B4sCU5/fHRuQ7p+Oasy0bamYXE4mfqVO3EdaNE9elmKDWFl4JmaOdhVHLxgfs2gdPMUiN5IYWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVe89+HKNvCKWq/SpESThjtUBJtH1f/3t04jaVbJWhE=;
 b=UjzaKE3AlEQwYfMjiR94NOJ0W7ZRE7/3s2SIKnJMWvaJXySiog+Vg2Fw9lmQCJfKpyLCKjxhl+C9YoFDPGvTuCG5VU8PmoHiqa+/vhNTj7QN7lLyFpiDeO6pAfFY7ljtuqQUq+XStv3sQGc9mXiyXESPX+7+mxphoAPeQhVh3fM=
Received: from MW3PR12MB4459.namprd12.prod.outlook.com (2603:10b6:303:56::22)
 by MWHPR12MB1262.namprd12.prod.outlook.com (2603:10b6:300:12::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Mon, 14 Jun
 2021 17:03:29 +0000
Received: from MW3PR12MB4459.namprd12.prod.outlook.com
 ([fe80::e03b:cca:5710:59a]) by MW3PR12MB4459.namprd12.prod.outlook.com
 ([fe80::e03b:cca:5710:59a%8]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 17:03:29 +0000
X-SNPS-Relay: synopsys.com
From:   Nelson Costa <Nelson.Costa@synopsys.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH 6/9] media: platform: Add Synopsys DesignWare HDMI RX
 Controller Driver
Thread-Topic: [PATCH 6/9] media: platform: Add Synopsys DesignWare HDMI RX
 Controller Driver
Thread-Index: AQHXV6HhRYZ7uibcgUqXqZQN5IkapqsAnNwAgAA6HiCAABxnAIAScxag
Date:   Mon, 14 Jun 2021 17:03:29 +0000
Message-ID: <MW3PR12MB4459B2314D8B8D4DC15A8100C1319@MW3PR12MB4459.namprd12.prod.outlook.com>
References: <cover.1622631488.git.nelson.costa@synopsys.com>
 <42b1ff078618a90973f25311eae725f0f151acc5.1622631488.git.nelson.costa@synopsys.com>
 <19a78e24-b767-e5bb-e932-e704fe8614be@xs4all.nl>
 <MW3PR12MB44591B23D792BF44BD666CAAC13D9@MW3PR12MB4459.namprd12.prod.outlook.com>
 <2a78fa1e-2243-1956-60ac-a2611e8bf8ad@xs4all.nl>
In-Reply-To: <2a78fa1e-2243-1956-60ac-a2611e8bf8ad@xs4all.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYm1Wc2MyOXVZMXhoY0hCa1lYUmhYSEp2WVcxcGJtZGNNRGxrT0RRNVlq?=
 =?utf-8?B?WXRNekprTXkwMFlUUXdMVGcxWldVdE5tSTROR0poTWpsbE16VmlYRzF6WjNO?=
 =?utf-8?B?Y2JYTm5MVFpsTkdNeVkySmpMV05rTXpJdE1URmxZaTA1Tm1aa0xXSTBaRFZp?=
 =?utf-8?B?Wkdaa09UUTRNRnhoYldVdGRHVnpkRncyWlRSak1tTmlaQzFqWkRNeUxURXha?=
 =?utf-8?B?V0l0T1RabVpDMWlOR1ExWW1SbVpEazBPREJpYjJSNUxuUjRkQ0lnYzNvOUlq?=
 =?utf-8?B?RTNNVFlpSUhROUlqRXpNalk0TVRZek9EQTNNVEkyT1RnMk1TSWdhRDBpU1hF?=
 =?utf-8?B?NVNHdDBkemg0TDFkTmNsTkhTVk42T0RScFlTdFdaVTVaUFNJZ2FXUTlJaUln?=
 =?utf-8?B?WW13OUlqQWlJR0p2UFNJeElpQmphVDBpWTBGQlFVRkZVa2hWTVZKVFVsVkdU?=
 =?utf-8?B?a05uVlVGQlNGbEpRVUZFYkdWWVVYaFFNa2hZUVdGcmVXZGpTMWQyUW5vMmNW?=
 =?utf-8?B?UkxRbmR3WVRoSVVHOU9RVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVaEJRVUZCUVVkRFFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVWQlFWRkJRa0ZCUVVFMWFFSmtNa0ZCUVVGQlFVRkJRVUZCUVVGQlFVRktO?=
 =?utf-8?B?RUZCUVVKdFFVZHJRV0puUW1oQlJ6UkJXWGRDYkVGR09FRmpRVUp6UVVkRlFX?=
 =?utf-8?B?Sm5RblZCUjJ0QlltZENia0ZHT0VGa2QwSm9RVWhSUVZwUlFubEJSekJCV1ZG?=
 =?utf-8?B?Q2VVRkhjMEZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUlVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?blFVRkJRVUZCYm1kQlFVRkhXVUZpZDBJeFFVYzBRVnBCUW5sQlNHdEJXSGRD?=
 =?utf-8?B?ZDBGSFJVRmpaMEl3UVVjMFFWcFJRbmxCU0UxQldIZENia0ZIV1VGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFWRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkRRVUZCUVVGQlEyVkJRVUZCV21kQ2RrRklWVUZpWjBKclFV?=
 =?utf-8?B?aEpRV1ZSUW1aQlNFRkJXVkZDZVVGSVVVRmlaMEpzUVVoSlFXTjNRbVpCU0Ux?=
 =?utf-8?B?QldWRkNkRUZJVFVGa1VVSjFRVWRqUVZoM1FtcEJSemhCWW1kQ2JVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUpCUVVGQlFVRkJRVUZCU1VGQlFVRkJRVW8wUVVGQlFtMUJSemhC?=
 =?utf-8?B?WkZGQ2RVRkhVVUZqWjBJMVFVWTRRV05CUW1oQlNFbEJaRUZDZFVGSFZVRmpa?=
 =?utf-8?B?MEo2UVVZNFFXTjNRblJCUjJ0QldYZEJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGRlFVRkJRVUZCUVVGQlFXZEJRVUZCUVVGdVow?=
 =?utf-8?B?RkJRVWRaUVdKM1FqRkJSelJCV2tGQ2VVRklhMEZZZDBKM1FVZEZRV05uUWpC?=
 =?utf-8?B?QlJ6UkJXbEZDZVVGSVRVRllkMEo2UVVoUlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJVVUZCUVVGQlFVRkJRVU5C?=
 =?utf-8?B?UVVGQlFVRkRaVUZCUVVGYVowSjJRVWhWUVdKblFtdEJTRWxCWlZGQ1prRklR?=
 =?utf-8?B?VUZaVVVKNVFVaFJRV0puUW14QlNFbEJZM2RDWmtGSVVVRmpkMEowUVVkTlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUWtGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGSlFVRkJRVUZCU2pSQlFVRkNiVUZIT0VGa1VVSjFRVWRSUVdO?=
 =?utf-8?B?blFqVkJSamhCWTBGQ2FFRklTVUZrUVVKMVFVZFZRV05uUW5wQlJqaEJaRkZD?=
 =?utf-8?B?ZEVGSFRVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVVkJRVUZCUVVGQlFVRkJaMEZCUVVGQlFXNW5RVUZCUjJOQlpFRkNl?=
 =?utf-8?B?a0ZHT0VGalFVSjVRVWM0UVZwQlFqRkJSMDFCWkVGQ1prRklVVUZqWjBKb1FV?=
 =?utf-8?B?ZHJRV0puUW5CQlJ6UkJXbmRCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZSUVVGQlFVRkJRVUZCUTBGQlFVRkJRVU5sUVVG?=
 =?utf-8?B?QlFXTjNRbWhCUjNkQldsRkNla0ZHT0VGWlVVSnFRVWROUVdKM1FqRkJSelJC?=
 =?utf-8?B?WkVGQ1prRklRVUZpUVVKb1FVYzBRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQ1FVRkJRVUZCUVVGQlFVbEJR?=
 =?utf-8?B?VUZCUVVGS05FRkJRVUo2UVVkRlFXSkJRbXhCU0UxQldIZENlRUZJVlVGaWQw?=
 =?utf-8?B?SXdRVWRWUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJSVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZuUVVGQlFVRkJibWRCUVVGSVRVRmlaMEozUVVoTlFWaDNRbk5C?=
 =?utf-8?B?UjJ0QldYZENiRUZITkVGamQwSnNRVVk0UVdSQlFteEJTRWxCWWxGQ1prRkVS?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVZGQlFVRkJRVUZCUVVGRFFVRkJRVUZCUTJWQlFVRkJZM2RDZFVGSVFV?=
 =?utf-8?B?RmpkMEptUVVkM1FXRlJRbXBCUjFWQlltZENla0ZIVlVGWWQwSXdRVWRWUVdO?=
 =?utf-8?B?blFuUkJSamhCWTNkQ01FRklWVUZhUVVKc1FVYzBRV1JCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVSkJRVUZCUVVGQlFVRkJTVUZCUVVGQlFVbzBRVUZC?=
 =?utf-8?B?UWpKQlIyTkJXSGRDY2tGSFZVRmxVVUl6UVVjNFFXTm5RbXRCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZGUVVGQlFVRkJRVUZCUVdkQlFV?=
 =?utf-8?Q?FBQUEiLz48L21ldGE+?=
authentication-results: xs4all.nl; dkim=none (message not signed)
 header.d=none;xs4all.nl; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2.80.233.231]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8da68e5d-e45d-4006-468e-08d92f56555b
x-ms-traffictypediagnostic: MWHPR12MB1262:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB12624C5BF6F66975CCA66E82C1319@MWHPR12MB1262.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SYjD5G6MJzYFoIZY/x/mrjEXIm9Nrpirn5aHbrKZj2ItVBqnNAf4dIiE24sLpPpKNa1cKwKIoLS9cQsdgaw7o3fYzlIah+Gin1eT2lEE+Jc7ZqDVJohX2otbiBgyjvZmoKthf+UhuGh2PhzcK6qCwOKT7Oi0GE/3cO44E3yhraD4/wVluN+3byzi5Vg0x6wOC59stibkbTB6y9HdGj6olTmyg8m4ihOuQxRBp4k1JjolcRgITZ1fVkKvZE3xVdiSAZTLHdegBBHZLRQlkGfHaC0iU4ST/2dC9ev2HS+cmXVxcv8YNo+0jQiiTD5tuaO3VZwCupuVn/yXzFoWqga7sstWtD6fXVj5zaKeW3HPFSoMvlN6AqsqX1RaGM1oYP5sM2g7tDvePs5TnMEHrHPKwFlpVn5oV8L0ZUsVTWz8sXSZTmBi7Kwb2NPnQNVfMcyzj3PhKiwFMXWVXladL1cwsOJZajS4PWY6B4nRya/wO50mxNyRNWDih9ZvguhfEBYM3wVeHL1MhDx0KJ82yK1x7mSSoac7+lusgsx6WrlVEUgF/t+KIgSDfuTZr8OilKY9EkOC6nzACOecpXaH6MLK7eoHRjc88nrW+PJF1EmtDqnLhVcBqa2Ic7XZfQZkHWkfscZnnrEy4R6AntqCj7KW0cnwLsjtlU3RUsDMvUUi8EdlN6yk4AXruMq6AlHc0ykkyWrAN0jQvGYA9Q6zN/d6gFzrgZKV68yDseW/wlRZ3vE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4459.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(376002)(39860400002)(136003)(86362001)(316002)(76116006)(8676002)(478600001)(7696005)(8936002)(966005)(33656002)(52536014)(54906003)(64756008)(66556008)(66476007)(66946007)(110136005)(66446008)(9686003)(4326008)(2906002)(5660300002)(186003)(71200400001)(53546011)(6506007)(122000001)(107886003)(26005)(38100700002)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTZtYXNkQjBXOTQvTjdDRDVBQjZyTkpEdXJERWM3TXU1NjB2Qzhqd1dhSVBT?=
 =?utf-8?B?RlJsZzJjaXowMG5EUDFkdXlpZHV3ZUp1TzBBN0JEVm40OVdmL2t3aGdFUlV4?=
 =?utf-8?B?UHN4RGhXbmt3QmovNG9NcWkzQTRkbnl0Skh2ZFUzN3Q0bmpZL2pDeXNPcUZi?=
 =?utf-8?B?Q3ZGRWFwZWRsWFI5WW52ZThLQnpPakZQU1QreVdYWXJBUWFXcTJ6MGtNMm9l?=
 =?utf-8?B?Yk1WbDIzR0w0SEZvZXl2SndHclAvc2dkQkM4bFZ3Mi9JZmVqVzlicThOUXor?=
 =?utf-8?B?WU10bDFKR1hWOHdzN21KaVZVdmdYV0o0ajJ4bkVvSlFJajRPUXJldWFFN2Mw?=
 =?utf-8?B?Tm9leVV4aklQUXFwV084RnAyVkdIZk1uL3h5Ykp2alBpWTgxRnBYSzBkREtQ?=
 =?utf-8?B?RG1ENCtNaFBsUXlIb0txK1VKempwc0lPTHp1KytwZG82MmFuVWJzSk9IRERC?=
 =?utf-8?B?RTAzUWJONkhiSnNsVUx5eFlncGRhdHFBdnZIcHRWblRBWlNHV29iQUtlQWF5?=
 =?utf-8?B?NFZUTzFIeEZSM2duTmRjVHE4K2lRd29jdjNXUDVFSi9xazBBQUZ4d1pacnVB?=
 =?utf-8?B?aE9jT3RDck9VdkQvRlBQM2lEc1EveDdyMGwvZFBUZWduZ0svMWY1UFlOcU50?=
 =?utf-8?B?T0dPK1ZSMUg1a25yelQyZC9ET0k3ekZQZnRXUTdNTkN4YnA2SFUxa0hLU3hy?=
 =?utf-8?B?eFA1dTAyWmQ1SmxLL1oyWkwvWm9vMUVjN1NqOGxDVlZOZk9Xam5KRDhaRkxj?=
 =?utf-8?B?QUNRUU1OMGptL29zSmd0SmU2RW03WTNZNHp5clZjOEFQTnNLdHBKL0xidTI0?=
 =?utf-8?B?cXZwM05Xcmp5RTNaZVdCUUc1ZFcyTE0yM2VMa2VRSW9nMUYzTkU4eXRZQlYx?=
 =?utf-8?B?Q00wWDhTQkNmRTgvcHRFcEMzbzJhei9qVHVyU3pwcnZ6WnZxck5SdWNnSi8w?=
 =?utf-8?B?eTdJd0tKNnAyWVpKQllHeTFJcXRNekJsSGNyUUtycjFSd1JmVWNYeXNtakFO?=
 =?utf-8?B?TkZ6aTdMYWlYTXhCbWV0ZSsvVXRDZXlBb0NVNmFiRXhmSElvZ1pCd2NlVjU3?=
 =?utf-8?B?UE9FV09qYWJ3VURZTEtaNkdKVnd5ZWVJbHlJVlpMUDQxMENOQXN1eTFmN1dz?=
 =?utf-8?B?T3RwYlVkbDhGVUEzWjZVQWNxM2k1RzFSVmFETU0vQ1Z6cmdoeWdUVzZFbDdz?=
 =?utf-8?B?SXhPTS9aTzJJQmpLU1dFcEczN3hiZll2MUlkRXcyc3FHRjJESDZvM1FqQmxK?=
 =?utf-8?B?ek93OEh1WktKZXQ5RFNOQXpuZTViUmlVSC8yRUNoTlFjM0w4SkVJTXlkelBP?=
 =?utf-8?B?aTVIbzdQQVJQcnQxRDJ6a3poOWd3c3JsUzhUR1NaSGl5VmVNcG11UE85MnRT?=
 =?utf-8?B?WGlBZ1dRTFAxWDhZbVN1Z3FiQ01OQzN5RjdWU0FqZGhheVVwc3RzbjM0ZFpM?=
 =?utf-8?B?MCtnRHRJY1dQcUhWTkY1aThhbWNpZThUOG9aOGMrQnVHbHpNNUhzRFJUZmMz?=
 =?utf-8?B?SHlFVUkzTDIyL2VMWkxWZ2tHUFZQb1dJWmlvckMwVytCTVlRQW9uSVFxNldE?=
 =?utf-8?B?bDl6bXBYZ2p5ekVVWmx3R2VERUI5eHpXcnJoeXYzN2pBOU16bS9JYTRjVjFE?=
 =?utf-8?B?dkFqWU92cjZuNW1nbVNGd1lOSUs3Wm14WnFBK3FsK3gwc3FPM3BQY0k1R04r?=
 =?utf-8?B?ZllNd2NXbHNUTmF3WmlncnRQK1JIdzNYSVIyYUNyTWk0RE1RNWhlWjVMdS84?=
 =?utf-8?Q?ZerQGWVYY5u0wPVFtU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4459.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da68e5d-e45d-4006-468e-08d92f56555b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2021 17:03:29.3342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oDFFvKGcikRrLfXgaF1v8bvS6Jl9X6Ct+OUsVQBFeDnVE9LXTy8/3k7MY94e3mGaLWfJvlRaPLhfjPd9R35mOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1262
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSGFucywNCg0KRnJvbTogSGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+
DQpEYXRlOiBxdWEsIGp1biAwMiwgMjAyMSBhdCAxODowNDoxOA0KDQo+IEhpIE5lbHNvbiwNCj4g
DQo+IE9uIDAyLzA2LzIwMjEgMTc6NDQsIE5lbHNvbiBDb3N0YSB3cm90ZToNCj4gPiBIaSBIYW5z
LA0KPiA+IA0KPiA+IFRoYW5rcyBmb3IgeW91ciBpbml0aWFsIGNvbW1lbnRzIGFuZCBmZWVkYmFj
ayENCj4gPiANCj4gPiBGcm9tOiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5u
bD4NCj4gPiBEYXRlOiBxdWEsIGp1biAwMiwgMjAyMSBhdCAxMjo1NDozOA0KPiA+IA0KPiA+PiBI
aSBOZWxzb24sDQo+ID4+DQo+ID4+IFRoYW5rIHlvdSBmb3IgdGhpcyBwYXRjaC4gU29tZSBpbml0
aWFsIGNvbW1lbnRzIGJlbG93LCBJIHdpbGwNCj4gPj4gbmVlZCB0byBnbyBvdmVyIHRoaXMgYW5v
dGhlciB0aW1lIGZvciBzb21lIG9mIHRoZSBjb2xvcmltZXRyeQ0KPiA+PiByZWxhdGVkIGZ1bmN0
aW9ucy4NCj4gPj4NCj4gPiANCj4gPiBPay4NCj4gPiANCj4gPj4gQlRXLCBpZiB5b3UgYXJlIGlu
dGVyZXN0ZWQgaW4gSERDUCBzdXBwb3J0LCBsZXQgbWUga25vdy4gQ2lzY28gd29ya2VkDQo+ID4+
IG9uIGFuIEFQSSBmb3IgdGhpcywgYnV0IGR1ZSB0byB2YXJpb3VzIHJlYXNvbnMgd2UgaGF2ZSBu
b3QgYmVlbiBhYmxlDQo+ID4+IHRvIHVwc3RyZWFtIGl0LiBCdXQgd2UgZG8gdXNlIGl0IGluIG91
ciBwcm9kdWN0cy4NCj4gPj4NCj4gPiANCj4gPiBHb29kIHRvIGtub3chIEluIHRoYXQgY2FzZSBp
ZiBpbiB0aGUgZnV0dXJlIHdlIHRoaW5rIHRvIHVwc3RyZWFtIA0KPiA+IHNvbWV0aGluZw0KPiA+
IHJlbGF0ZWQgd2l0aCBIRENQIHdlIHdpbGwgbGV0IHlvdSBrbm93LiA6KQ0KPiA+IEJUVywgd2hp
Y2ggdmVyc2lvbnMgb2YgSERDUCAoMS40LCAyLjIsIDIuMykgdGhlIEFQSSBzdXBwb3J0cz8NCj4g
DQo+IEl0J3MgZGVzaWduZWQgZm9yIGFsbCB2ZXJzaW9ucywgYnV0IGl0IGhhcyBvbmx5IGJlZW4g
dGVzdGVkIHdpdGggMS40DQo+IHJlY2VpdmVycy4NCj4gDQo+IFlvdSBjYW4gZmluZCBpdCBoZXJl
Og0KPiANCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0LmxpbnV4dHYu
b3JnL2h2ZXJrdWlsL21lZGlhX3RyZWUuZ2l0L2xvZy8/aD10YzM1ODg0MF9fOyEhQTRGMlI5R19w
ZyFQYTdOS29xMWdneFVRUlp3SFVnQ1RDMUEzNnBKc1N4SUNLZVZSRld0UEhNbGY5eFVFRGp0VGpy
QlYwaDdBODF6TkRvJCANCj4gDQo+IEJUVywgZG9uJ3Qgd2FpdCBmb3IgdGhlIGZvbGxvdy11cCBy
ZXZpZXcgdy5yLnQuIGNvbG9yaW1ldHJ5LCBpdCBtaWdodA0KPiB0YWtlIDEtMiB3ZWVrcyBiZWZv
cmUgSSBnZXQgYXJvdW5kIHRvIHRoYXQsIEkgbmVlZCB0byBjYXJ2ZSBvdXQgdGltZQ0KPiBmb3Ig
dGhhdC4gRmVlbCBmcmVlIHRvIHBvc3QgYSB2MiBiYXNlZCBvbiB0aGUgY3VycmVudCByZXZpZXcu
DQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gCUhhbnMNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2sg
YW5kIGZvciBwcm92aWRpbmcgdGhlIEhEQ1AgcmVsYXRlZCBsaW5rIQ0KDQpCUiwNCg0KTmVsc29u
IENvc3RhDQo=
