Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B9A3B1E3D
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 18:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbhFWQEX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 12:04:23 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:48702 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230430AbhFWQEW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 12:04:22 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BE5F540FE5;
        Wed, 23 Jun 2021 16:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1624464125; bh=/aJPn9XNXOIL4gbnz9MH/edvpTQlpaUr6WciMfS03/4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=WRpTjq6CLDo1NpOPa7vZXdFyy9eTzDRf3HHKtFq9MQ1vfpMlUYPug+WIk5stgCBTp
         jS1ovEWJokM+SoTJqNskwzZ77P//WSzvno7hcGQcJ2S7ttU+Oef6dAoipmedVY7/vY
         3i3pPjZyGmanEtmUeIKW9YNQpevPUPAWo57S8GBgJfpoi57kR/ukHQH3EUzWqyZoJi
         7lV7Lc8PSXwm5ikxy1CYihd73wZRiWO8wN8bkS7sZPkRUP9hB7kF9CBAfftGmkUAVD
         x7qOuuYyoeVoYnITd462SArVi54haiLpJUeJyCy8Sp481ZyFcMWkvd3g1qy9jWGYL0
         ajoMJuecwXT7Q==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id AB6CBA00C4;
        Wed, 23 Jun 2021 16:02:03 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id C07F040099;
        Wed, 23 Jun 2021 16:02:02 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=nelsonc@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="mbegh6rz";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cig9tMiyYu7bMR+3oQvewAC6EAR7moJpb0MoJAAY5tte2yyaDmBUkAJ+5MNccTEWyneLjaD4L3wJ2bRNxVOmcjZDSRFh4r4lku/twtsleZrg/RNkHhkDlJuHKJV4ItoPHFeVUyAptTHohiCB9HEUqrGSYaZoNXtEKAslzf/xSt4wMdW7WLbMfIAMIyLQf8HTRBTyvO4W7Ke2JbBtZBvJzDP0KHPXlFGTxu/qd8YC8OBNuHRB/tk3cK+v4b0OGG649PPbfgDzV87UVnRoI4LmtHAekgHmJsbE49wHzag+wQ9F4Ixpyjp/HKJWZxPWzdvHCoJGFOJFtyQ0tRPL67hmfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RL0yU1vlo55OGlZfa8YNHZ9OTC83338Qgnj8tKpq/2c=;
 b=ieyLVoZtMXg3QM+5/ds7TUQWTGr/fFlp5r9ZlVOq9Wxk43vPmpnTnSko7cL3sFbco7eU+vUmTD3iFvyiZJSHdCAlKrcnjm4Q5mSkTOfAPgs1GGGRCFWfPydotJmIDL5kt2/lCD8OR2RI41VJmI6Lqstwy2MgUdHeTReI7cU19KypvHEkmyEIy/B7VYBBogKmBCvOjTEFQyB2RR5n0smrMWt3ZIxi80tHHAxOzvD1Txotyl2aBnHpkcsbTFfvawrwpRZIigAc2Q1Wum5zfjq+NojMMBz6JzNWWDYQFmtBADnR3RAlZA1ohteirS0zWoGYQzayKya9YdjsKSU5aSQtbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RL0yU1vlo55OGlZfa8YNHZ9OTC83338Qgnj8tKpq/2c=;
 b=mbegh6rzJ9jdCbyjsGIwh8kP2+jawJKInyS/TTzIjtSqEgUOZEppnWz+5mvaUux92MZRNCHZ9xXr6dIv0tZkwABB5me06Z/FjzmrCPOVQioEi5yPJZrJQKAKMAfwKAvEgMePV1oFFv1sXcSpYq3guytjIabu5T+mh3fMmD6As7U=
Received: from MW3PR12MB4459.namprd12.prod.outlook.com (2603:10b6:303:56::22)
 by MWHPR1201MB0094.namprd12.prod.outlook.com (2603:10b6:301:5a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Wed, 23 Jun
 2021 16:02:01 +0000
Received: from MW3PR12MB4459.namprd12.prod.outlook.com
 ([fe80::e03b:cca:5710:59a]) by MW3PR12MB4459.namprd12.prod.outlook.com
 ([fe80::e03b:cca:5710:59a%8]) with mapi id 15.20.4242.023; Wed, 23 Jun 2021
 16:02:00 +0000
X-SNPS-Relay: synopsys.com
From:   Nelson Costa <Nelson.Costa@synopsys.com>
To:     Vinod Koul <vkoul@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH 5/9] phy: dwc: Add Synopsys DesignWare HDMI RX PHYs e405
 and e406 Driver
Thread-Topic: [PATCH 5/9] phy: dwc: Add Synopsys DesignWare HDMI RX PHYs e405
 and e406 Driver
Thread-Index: AQHXV6Hhw52rFLqJRUefJUBB/2fxaqseFEGAgAOKeVA=
Date:   Wed, 23 Jun 2021 16:02:00 +0000
Message-ID: <MW3PR12MB4459E69C4CE32CDD14C93929C1089@MW3PR12MB4459.namprd12.prod.outlook.com>
References: <cover.1622631488.git.nelson.costa@synopsys.com>
 <ac32f8d433860c5be612b393023329f967e2c058.1622631488.git.nelson.costa@synopsys.com>
 <YNApWS7tNGdWbyCm@vkoul-mobl>
In-Reply-To: <YNApWS7tNGdWbyCm@vkoul-mobl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbmVsc29uY1xh?=
 =?us-ascii?Q?cHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJh?=
 =?us-ascii?Q?MjllMzViXG1zZ3NcbXNnLTU0N2JjOWNkLWQ0M2MtMTFlYi05NmZkLWI0ZDVi?=
 =?us-ascii?Q?ZGZkOTQ4MFxhbWUtdGVzdFw1NDdiYzljZS1kNDNjLTExZWItOTZmZC1iNGQ1?=
 =?us-ascii?Q?YmRmZDk0ODBib2R5LnR4dCIgc3o9IjgwMDIiIHQ9IjEzMjY4OTM3NzE3NTk2?=
 =?us-ascii?Q?OTkyMSIgaD0iUEU0RXl0OGhYb1UzbVUzalVTNitzY0lxd3BFPSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBSFlJQUFD?=
 =?us-ascii?Q?Qm9Bb1lTV2pYQWZOalNKRzdiUk8wODJOSWtidHRFN1FOQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUhBQUFBQUdDQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQVFBQkFBQUE1aEJkMkFBQUFBQUFBQUFBQUFBQUFKNEFBQUJtQUdrQWJn?=
 =?us-ascii?Q?QmhBRzRBWXdCbEFGOEFjQUJzQUdFQWJnQnVBR2tBYmdCbkFGOEFkd0JoQUhR?=
 =?us-ascii?Q?QVpRQnlBRzBBWVFCeUFHc0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtBWHdC?=
 =?us-ascii?Q?d0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCbkFHWUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFB?=
 =?us-ascii?Q?QUFBQ2VBQUFBWmdCdkFIVUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFiZ0Js?=
 =?us-ascii?Q?QUhJQWN3QmZBSE1BWVFCdEFITUFkUUJ1QUdjQVh3QmpBRzhBYmdCbUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1BRzhB?=
 =?us-ascii?Q?ZFFCdUFHUUFjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWN3QnRB?=
 =?us-ascii?Q?R2tBWXdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFIa0FY?=
 =?us-ascii?Q?d0J3QUdFQWNnQjBBRzRBWlFCeUFITUFYd0J6QUhRQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNB?=
 =?us-ascii?Q?QUFBQUFDZUFBQUFaZ0J2QUhVQWJnQmtBSElBZVFCZkFIQUFZUUJ5QUhRQWJn?=
 =?us-ascii?Q?QmxBSElBY3dCZkFIUUFjd0J0QUdNQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCbUFH?=
 =?us-ascii?Q?OEFkUUJ1QUdRQWNnQjVBRjhBY0FCaEFISUFkQUJ1QUdVQWNnQnpBRjhBZFFC?=
 =?us-ascii?Q?dEFHTUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR2NBZEFCekFGOEFjQUJ5QUc4?=
 =?us-ascii?Q?QVpBQjFBR01BZEFCZkFIUUFjZ0JoQUdrQWJnQnBBRzRBWndBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFB?=
 =?us-ascii?Q?Q0FBQUFBQUNlQUFBQWN3QmhBR3dBWlFCekFGOEFZUUJqQUdNQWJ3QjFBRzRB?=
 =?us-ascii?Q?ZEFCZkFIQUFiQUJoQUc0QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJ6?=
 =?us-ascii?Q?QUdFQWJBQmxBSE1BWHdCeEFIVUFid0IwQUdVQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFITUFiZ0J3QUhNQVh3QnNB?=
 =?us-ascii?Q?R2tBWXdCbEFHNEFjd0JsQUY4QWRBQmxBSElBYlFCZkFERUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFB?=
 =?us-ascii?Q?QUFDQUFBQUFBQ2VBQUFBY3dCdUFIQUFjd0JmQUd3QWFRQmpBR1VBYmdCekFH?=
 =?us-ascii?Q?VUFYd0IwQUdVQWNnQnRBRjhBY3dCMEFIVUFaQUJsQUc0QWRBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFB?=
 =?us-ascii?Q?QjJBR2NBWHdCckFHVUFlUUIzQUc4QWNnQmtBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUEiLz48L21ldGE+?=
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2.80.233.231]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9584d674-2450-4d1e-a585-08d936603c7e
x-ms-traffictypediagnostic: MWHPR1201MB0094:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1201MB00948E4D969F2DEE771803D1C1089@MWHPR1201MB0094.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jT2+rdnQQrd8tSIRPFvxJcXmqIrvZQolf2j4Nu1x3DKS+ALgURh+zF8s414wCeB+c13fH7evmteP+LUV4IGfzxTFyFfHqgmtxTsm9CPgLwKhu4n9XnZ401F9Gus4Dy7Cxl5koVoKZbhCnDKyhcweHqMDtusblbNCUqWAGm9YOdI0zaSpHJLQMJhOI3j+gyXeajwidiFtSAr0SBo3DCOh+ReXoB7uBU6YMGsMlToRJkGTlF9Sua70N+fUpHLcdpZcS94LmRfgvJuiXIR50O7WZ3W7upfdVvZRvJKeDz56e+PRNS1JJdTjOFO/LMnumZkftws7IFKf6BuxSYXApfzRCGvRN58nYytFMsUNNXUKLGr5R4s2onDJjYUf66a2gnijdJPJPfV2a79fQfiFJwwZa0jG+Eja9WGbxvN/OirtlnjN5ThcHVJk6Wls5AoBfHGnLFkGZelw5gE3J3sxl+dSUeQPBhUGJKykB3mpB3bAppDG1IuGvLz/CdgK2KSjDBK+/geBJKB224d7ly3nLoS6MeoCu5mqK9BNln6pziMwqsXf5qbnMgB0EhGFmG/kGWKHNf8jzU7iOl1jDprTDH6gEzeCNqopkfRWFvwJAk3ICibZ/iceVit39mn4f++PaNDrhoCqdArSdwQVLjdGL3pgKw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4459.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(376002)(136003)(346002)(39860400002)(76116006)(66946007)(38100700002)(6916009)(64756008)(107886003)(8676002)(478600001)(66476007)(66556008)(122000001)(2906002)(66446008)(33656002)(4326008)(316002)(52536014)(8936002)(26005)(54906003)(86362001)(5660300002)(7696005)(6506007)(53546011)(186003)(55016002)(71200400001)(9686003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PxDR9AgClLGli+M0DUK8wHFQU0YGR/cMX9HvU4SSXAUI7OFcZCQJJIJS6mm1?=
 =?us-ascii?Q?FBf5S4JtaRlDz5NYrtoXmcV2U7rmYoCz0yhdjrf/g/H2QMK5JuGHfdViIkX3?=
 =?us-ascii?Q?Ej62j8HJGwMEB+9AglgQJhwCKlZ0+qhxBPJJgPcvJdVfwyjGmlO+4HHPv9P/?=
 =?us-ascii?Q?7B8CP9Ra0guDGZDzcJ0lswgkMJi0Nlq9l/KSgtOs6gAMKEXcgw3Paw9Jy0jA?=
 =?us-ascii?Q?8fmXU9WZ3guZeRGikrgfvEWHoScz6X2wipxUCaap8r02AaXBC1jKQ8wmxThX?=
 =?us-ascii?Q?UOCjXH/wc/+3i2pDssXEt5WjpEjqL9vIb1VYlbWx20NnrMG2Fw/KuUXkkDr4?=
 =?us-ascii?Q?hVU4RSAS40RkTyzlEU7k8xuNvN61sLR8pzlej3rh++kxwEJobnaIR3xC/nrb?=
 =?us-ascii?Q?02dAWZi8ylLsk9S2NOrYUJ9LmpJcg5TSL0AqYU/5up7A6ztw8JmWomr3NshW?=
 =?us-ascii?Q?X43JqlVW+4uzR2tZnNvsfBO12vc0PkXChUojLx5IfM2r50WLSeqxK73KWpKa?=
 =?us-ascii?Q?ONyVmx8QAP+89VahD7SYkcL5PBK5uDzMBUoCq72/B/MT27JRUorEriJQHts2?=
 =?us-ascii?Q?igqehRg3wzm9ZgICCZ+dUvupE+LCvqxpT/Gb4P44oVXmu4Kjzt03QhRNNXlC?=
 =?us-ascii?Q?N1ftPmh9bzq7Xfq+lbO8pREk/eqrAzKazuD7HFSSveZinsaiogZaaeNdAge2?=
 =?us-ascii?Q?Mk8i5i1LkWMO85WAtrWaagcFNaINXBI5LL83eW6gmKKAW6uyTI4xCzTOvMlt?=
 =?us-ascii?Q?CPgur1tGWR3YHjfAIfK9C+RQhbzOmc5nwAgBL+zgJsNdu70ufYxYHTAOXXas?=
 =?us-ascii?Q?5eqFV/Uok3N4VJvcSBrWznuhOYH/8agWiTpYEw6f8WCiN4Iq02VBmV/e1KKa?=
 =?us-ascii?Q?SrD9kf6wBDuUNzseFJGrYMaYphOi8zfiFI/wSUBwpXSh6T4LYjz8xa7HYNx9?=
 =?us-ascii?Q?0o33n7UDuO5H7SEEId0pe721GSEXXgmIUPo4iT84r6fQSKk8mDMdNBFsAQBj?=
 =?us-ascii?Q?mMJYsuTbSBaBiFPxpfrBUcdL4ceLnks5Adcu9x/wcPpjpZclRnCXRr1EdTts?=
 =?us-ascii?Q?pKqPgNUuWEuSxsQWrGMt/5lq+BJbsQWlRSP8bmZOUK44kcEV2ZAO7Hh46RYY?=
 =?us-ascii?Q?eOhQ8GhWPxkHKKjHrQ5MCqr4MNcoE7UGatA5bc5md9jLRORL+u052BiOCe62?=
 =?us-ascii?Q?bZqlbh3jKojbH6xq7GqfMMSoj40akdo19pDgmT12H3Rj9PhVwnvoc3vMFTWN?=
 =?us-ascii?Q?GYd+3/dXVXPqnpCNVCgrR22HaVywQYk+qM64tuW3Gs13F/JJZDGoa63dWgjB?=
 =?us-ascii?Q?3cY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4459.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9584d674-2450-4d1e-a585-08d936603c7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 16:02:00.7278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Q0/h/xrvGiibjjy9yqB1Az1R5JFmlmO4q18dhztz+UrkRl1bpOPC/lQogNcwvDSzQ9uMAQh2Bt0yfOU2W5QvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0094
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vinod,

Thanks for your initial comments and feedback!

From: Vinod Koul <vkoul@kernel.org>
Date: seg, jun 21, 2021 at 06:53:29

> On 02-06-21, 13:24, Nelson Costa wrote:
>=20
> > +# Makefile for the PHY drivers.
> > +#
> > +
> > +phy-dw-hdmi-e40x-y			:=3D phy-dw-hdmi-e40x-core.o
> > +phy-dw-hdmi-e40x-y			+=3D phy-dw-hdmi-e405.o
> > +phy-dw-hdmi-e40x-y			+=3D phy-dw-hdmi-e406.o
>=20
> why not:
> phy-dw-hdmi-e40x-y                   :=3D  phy-dw-hdmi-e40x-core.o phy-dw=
-hdmi-e405.o phy-dw-hdmi-e406.o ?
>=20

I agree! It will be addressed in v2.

> > +obj-$(CONFIG_VIDEO_DWC_HDMI_PHY_E40X)	+=3D phy-dw-hdmi-e40x.o
> > diff --git a/drivers/phy/dwc/phy-dw-hdmi-e405.c b/drivers/phy/dwc/phy-d=
w-hdmi-e405.c
> > new file mode 100644
> > index 0000000..5078a86
> > --- /dev/null
> > +++ b/drivers/phy/dwc/phy-dw-hdmi-e405.c
> > @@ -0,0 +1,497 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2018 - present Synopsys, Inc. and/or its affiliates.
> > + * Synopsys DesignWare HDMI PHY e405
>=20
> 2018 - 2021 ?
>=20

It will be addressed in v2.

> > +/* PHY e405 mpll configuration */
> > +static const struct dw_phy_mpll_config dw_phy_e405_mpll_cfg[] =3D {
> > +	{ 0x27, 0x1B94 },
>=20
> Lowercase please
>=20

It will be addressed in v2.

> > +	{ 0x28, 0x16D2 },
> > +	{ 0x29, 0x12D9 },
> > +	{ 0x2A, 0x3249 },
> > +	{ 0x2B, 0x3653 },
> > +	{ 0x2C, 0x3436 },
> > +	{ 0x2D, 0x124D },
> > +	{ 0x2E, 0x0001 },
> > +	{ 0xCE, 0x0505 },
> > +	{ 0xCF, 0x0505 },
> > +	{ 0xD0, 0x0000 },
> > +	{ 0x00, 0x0000 },
> > +};
> > +
> > +/* PHY e405 equalization functions */
> > +static int dw_phy_eq_test(struct dw_phy_dev *dw_dev,
> > +			  u16 *fat_bit_mask, int *min_max_length)
>=20
> Please align this to preceding line open brace (checkpatch with --strict =
would warn you about this)
>=20

This is aligned in the original source code, and checkpatch clean. :)
Seems that only in patch format due the char '+' gives that effect.

> > +{
> > +	u16 main_fsm_status, val;
> > +	unsigned int i;
> > +
> > +	for (i =3D 0; i < DW_PHY_EQ_WAIT_TIME_START; i++) {
> > +		main_fsm_status =3D dw_phy_read(dw_dev, DW_PHY_MAINFSM_STATUS1);
> > +		if (main_fsm_status & DW_PHY_CLOCK_STABLE)
> > +			break;
> > +		mdelay(DW_PHY_EQ_SLEEP_TIME_CDR);
> > +	}
> > +
> > +	if (i =3D=3D DW_PHY_EQ_WAIT_TIME_START) {
> > +		dev_dbg(dw_dev->dev, "PHY start conditions not achieved\n");
>=20
> not error?
>=20

In the reality this is not an error scenario.
The 'ETIMEDOUT' return code is used by the HDMI RX Controller driver to=20
know that the equalization was not performed due the lack of Clock=20
Stable, and in this case the driver will keep forcing the equalization.

This scenario is something that can happen during HDMI Source Video=20
transitions, or even in scenarios that the Source is not sending video at=20
all.

That's why the message is not an error but instead only useful for debug=20
purposes.

BTW, the print message will be changed in v2 to make more clear it's not=20
an error scenario:
"PHY start conditions not achieved\n" -> "Clock received is not stable=20
yet\n"

> > +		return -ETIMEDOUT;
> > +	}
> > +
> > +	if (main_fsm_status & DW_PHY_PLL_RATE_BIT1) {
> > +		dev_dbg(dw_dev->dev, "invalid pll rate\n");
>=20
> error?
>=20

This is not an error scenario also.
The 'EINVAL' return code is used by the HDMI RX Controller driver to know=20
that the Equalization is not required and only needs to wait for tmds=20
valid to proceed.

BTW, the print message will be changed in v2 to make more clear it's not=20
an error scenario:
"invalid pll rate\n" -> "Equalization not required\n"

> > +		return -EINVAL;
> > +	}
> > +
> > +	val =3D dw_phy_read(dw_dev, DW_PHY_CDR_CTRL_CNT) &
> > +		DW_PHY_HDMI_MHL_MODE_MASK;
>=20
> can be single line
>=20

But in single line seems that would not fit in the 80 chars.

> > +static void dw_phy_eq_init_vars(struct dw_phy_eq_ch *ch)
> > +{
> > +	ch->acc =3D 0;
> > +	ch->acq =3D 0;
> > +	ch->last_acq =3D 0;
> > +	ch->valid_long_setting =3D 0;
> > +	ch->valid_short_setting =3D 0;
>=20
> memset() ?
>=20

In this function we only initialize some fields of 'ch' with 0.
There are other fields that are not supposed to be zeroed.

> > +static bool dw_phy_eq_acquire_early_cnt(struct dw_phy_dev *dw_dev,
> > +					u16 setting, u16 acq,
> > +					struct dw_phy_eq_ch *ch0,
> > +					struct dw_phy_eq_ch *ch1,
> > +					struct dw_phy_eq_ch *ch2)
> > +{
> > +	u16 lock_vector =3D 0x1 << setting;
> > +	unsigned int i;
> > +
> > +	ch0->out_bound_acq =3D 0;
> > +	ch1->out_bound_acq =3D 0;
> > +	ch2->out_bound_acq =3D 0;
> > +	ch0->acq =3D 0;
> > +	ch1->acq =3D 0;
> > +	ch2->acq =3D 0;
> > +
> > +	dw_phy_eq_equal_setting(dw_dev, lock_vector);
> > +	dw_phy_eq_auto_calib(dw_dev);
> > +
> > +	mdelay(DW_PHY_EQ_SLEEP_TIME_CDR);
> > +	if (!dw_phy_tmds_valid(dw_dev))
> > +		dev_dbg(dw_dev->dev, "TMDS is NOT valid\n");
> > +
> > +	ch0->read_acq =3D dw_phy_read(dw_dev, DW_PHY_CH0_EQ_STATUS3);
> > +	ch1->read_acq =3D dw_phy_read(dw_dev, DW_PHY_CH1_EQ_STATUS3);
> > +	ch2->read_acq =3D dw_phy_read(dw_dev, DW_PHY_CH2_EQ_STATUS3);
> > +
> > +	ch0->acq +=3D ch0->read_acq;
> > +	ch1->acq +=3D ch1->read_acq;
> > +	ch2->acq +=3D ch2->read_acq;
> > +
> > +	ch0->upper_bound_acq =3D ch0->read_acq + DW_PHY_EQ_BOUNDSPREAD;
> > +	ch0->lower_bound_acq =3D ch0->read_acq - DW_PHY_EQ_BOUNDSPREAD;
> > +	ch1->upper_bound_acq =3D ch1->read_acq + DW_PHY_EQ_BOUNDSPREAD;
> > +	ch1->lower_bound_acq =3D ch1->read_acq - DW_PHY_EQ_BOUNDSPREAD;
> > +	ch2->upper_bound_acq =3D ch2->read_acq + DW_PHY_EQ_BOUNDSPREAD;
> > +	ch2->lower_bound_acq =3D ch2->read_acq - DW_PHY_EQ_BOUNDSPREAD;
> > +
> > +	for (i =3D 1; i < acq; i++) {
>=20
> why do we start from 1 here..?
>=20

Because the first acquisition is required to be done before and out of=20
the for loop.

> > +static const struct dw_phy_mpll_config dw_phy_e406_mpll_cfg[] =3D {
> > +	{ 0x27, 0x1C94 },
> > +	{ 0x28, 0x3713 },
> > +	{ 0x29, 0x24DA },
> > +	{ 0x2A, 0x5492 },
> > +	{ 0x2B, 0x4B0D },
> > +	{ 0x2C, 0x4760 },
> > +	{ 0x2D, 0x008C },
> > +	{ 0x2E, 0x0010 },
> > +	{ 0x00, 0x0000 },
>=20
> lower case here too please
>=20

It will be addressed in v2.

> > +static void dw_phy_eq_init_vars(struct dw_phy_eq_ch *ch)
> > +{
> > +	ch->acc =3D 0;
> > +	ch->acq =3D 0;
> > +	ch->last_acq =3D 0;
> > +	ch->valid_long_setting =3D 0;
> > +	ch->valid_short_setting =3D 0;
> > +	ch->best_setting =3D DW_PHY_EQ_SHORT_CABLE_SETTING;
> > +}
>=20
> duplicate, it would make sense to create a common lib of such functions
> and use them across these files
>=20

This function initializes the 'ch->best_setting =3D=20
DW_PHY_EQ_SHORT_CABLE_SETTING' where the define can be tuned=20
independently for each PHY.

Regarding the other fields, we can create a common function=20
'_dw_phy_eq_init_vars()' in the common files phy-dw-hdmi-e40x.h/c and=20
call it inside the original function.

> > +static int dw_phy_set_data(struct dw_phy_dev *dw_dev)
> > +{
> > +	const struct dw_hdmi_phy_data *of_data;
> > +
> > +	of_data =3D of_device_get_match_data(dw_dev->dev);
> > +
> > +	if (of_data) {
> > +		dw_dev->phy_data =3D (struct dw_hdmi_phy_data *)of_data;
> > +	} else if (dw_dev->config->version =3D=3D dw_phy_e405_data.version) {
> > +		dw_dev->phy_data =3D &dw_phy_e405_data;
> > +	} else if (dw_dev->config->version =3D=3D dw_phy_e406_data.version) {
> > +		dw_dev->phy_data =3D &dw_phy_e406_data;
>=20
> Driver supports only of, where will these else cases get triggered?
>=20

The driver supports the following two use cases:
 1. Device Tree support: where the configuration data is supported by the=20
DT itself
 2. Non Device Tree support: where the configuration data is passed=20
through the platform_data

So, the "else cases" are used for the second use case (Non Device Tree=20
support).

> --=20
> ~Vinod

Thanks,

BR,

Nelson Costa
