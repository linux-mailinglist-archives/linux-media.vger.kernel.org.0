Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD41A3AA31B
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 20:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbhFPSYF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 14:24:05 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:33892 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231613AbhFPSYE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 14:24:04 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5E7AD40659;
        Wed, 16 Jun 2021 18:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1623867717; bh=6i++e3ZdpOc5D9+EJMtQDtIhznrcUuUTSIF+kMpEdwk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=ZH3y7IEVh5oE8IGuKx4sAIU4IcBGbF6p8z1++BwOTarH0TXA12m0vfIW7+PVndC19
         N8SaT7dQqGv4TzCZC6sZax059MLub8N7bMSGP+SrxKBfZkVXtMHn1O66QBsEBvr2nZ
         eqCf9jcV5ck+Mg4Ka5dFuqb2Mmd66L4Uqo4atuZnngfMKZiCjrvR1j4rjMPJ7X1NTS
         8sPYI36ksH9ciCI1bC+JIwP3dJWFe/7GW8JAYrUCLYxFnOZy9UX4/dSDC14MC8mf7I
         NqGGBIycZIiD7UPzaTCakt5coVpWs4ZRwXEhu3/DsVaES3MJOUSvcxpdFMm4aMQE7t
         vi+YS8HTSMy3A==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 5C178A0081;
        Wed, 16 Jun 2021 18:21:56 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id EC82080062;
        Wed, 16 Jun 2021 18:21:54 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=nelsonc@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="CIRhsqLc";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ip/iv3s5j01WoSWpRQ7bU71lV7mXrw7q980+eqYVnjHB1i6dBe+tyK6Sm98LTPSlvj0O3sJu5TM6q4kErqEPlcuMCAXSKfJXEdhKOKxtxhmR1pRl8HE8TkhNxMhB9tNmf7LeVF8i1Vgb1CDRo26cTjHzT2NN93rBT7kvMIrXcGj8Vs6su/zzs4DdNlZ38X9hBrHwoxqPAg/sQ3vUh8h1m3+c5XrlY8ZSfGISELwruwVqsV7rY4Z5i4VSC+bTHsz1yQ3uB2ncehIqtnNfWcqIpwnndrFjIAIQ51c1lIsOfIALk5rouluLFZIav39iZ/7kEAHuUMuO0ENcGLxgozvm4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pargVNPqAmnRF5hembwtLMW+K3A0jJ766NeaT+P0rJk=;
 b=PMFTtUhB0ps/HEbHB+C/ROQXX3fK8SaoTu8XbweaURawMBO0S3I7/inAF7pl41fN3s5zUhLNFXVdXRjfQ+NEDQQP6ZzPh8KmVEma8XGpA2XVkTq//dM5pJjxv8sQ8Jy36nOhZgYTgkHZwWpqWevMEmn5fOmQNput4MdJ+oe0Qly5+wq6vCZ8LYJukbKEWA1DD7DJS7lbTdtoZLfbAfzy5dFO7m25OWpu519ksLycIXA4mOUqsG0nuvtS1M86fnJrh9LoWKiLqlJmaxAqy5SsSRqdwaffjyxuW3Y55QyeHRAGbyyTDKH5WyruTla+U18LzhoJlKj+TBRCAtixGbYmKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pargVNPqAmnRF5hembwtLMW+K3A0jJ766NeaT+P0rJk=;
 b=CIRhsqLcvJxGhqA5nhpKx0a8BHMaoBOarGo6Yc2Tig221Ezk2lTVulnhpKL1+ztEE35VFExYh2DeFLK74Am8DVcbBbFOEG89a44ac1/WC1/2xIsOVGBTGWbpuOt6hDAPfk6dUMfDud7zNWF210W/ZW49BdF8OVVBRx7tFmMh3IY=
Received: from MW3PR12MB4459.namprd12.prod.outlook.com (2603:10b6:303:56::22)
 by MWHPR1201MB0224.namprd12.prod.outlook.com (2603:10b6:301:55::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Wed, 16 Jun
 2021 18:21:52 +0000
Received: from MW3PR12MB4459.namprd12.prod.outlook.com
 ([fe80::e03b:cca:5710:59a]) by MW3PR12MB4459.namprd12.prod.outlook.com
 ([fe80::e03b:cca:5710:59a%8]) with mapi id 15.20.4219.026; Wed, 16 Jun 2021
 18:21:52 +0000
X-SNPS-Relay: synopsys.com
From:   Nelson Costa <Nelson.Costa@synopsys.com>
To:     Rob Herring <robh@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH 2/9] dt-bindings: media: Document Synopsys DesignWare HDMI
 RX
Thread-Topic: [PATCH 2/9] dt-bindings: media: Document Synopsys DesignWare
 HDMI RX
Thread-Index: AQHXV6Hh6CGv0WSVIkW1H4BHlDvfK6sV0HgAgAEoHSA=
Date:   Wed, 16 Jun 2021 18:21:52 +0000
Message-ID: <MW3PR12MB445976E9C6911650D545C9D7C10F9@MW3PR12MB4459.namprd12.prod.outlook.com>
References: <cover.1622631488.git.nelson.costa@synopsys.com>
 <a5a52c738db7a4b3125225ac27e5aaff19604aec.1622631488.git.nelson.costa@synopsys.com>
 <20210615234048.GA1668783@robh.at.kernel.org>
In-Reply-To: <20210615234048.GA1668783@robh.at.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbmVsc29uY1xh?=
 =?us-ascii?Q?cHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJh?=
 =?us-ascii?Q?MjllMzViXG1zZ3NcbXNnLWI1YzFhNjk0LWNlY2YtMTFlYi05NmZkLWI0ZDVi?=
 =?us-ascii?Q?ZGZkOTQ4MFxhbWUtdGVzdFxiNWMxYTY5NS1jZWNmLTExZWItOTZmZC1iNGQ1?=
 =?us-ascii?Q?YmRmZDk0ODBib2R5LnR4dCIgc3o9IjUxMTAiIHQ9IjEzMjY4MzQxMzA5ODgx?=
 =?us-ascii?Q?NzM1MiIgaD0iS3l5YThLeFp5cHM3a04yYmEyT1JHclhIanhrPSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBSFlJQUFC?=
 =?us-ascii?Q?SVoxZDUzR0xYQVI4aERNaitDd2hCSHlFTXlQNExDRUVOQUFBQUFBQUFBQUFB?=
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
x-ms-office365-filtering-correlation-id: 53320397-3a22-4f5e-b61a-08d930f39d95
x-ms-traffictypediagnostic: MWHPR1201MB0224:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1201MB0224DB0405FEAD0CBAF5F720C10F9@MWHPR1201MB0224.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nOjPzhBNC7RBEFVylOx6DBdG48xPUSLNlQ9znYncZmFLo9WmxALYhOZdyisRg8RwyO7YnYUSRbW01CLWW+SV4Pz/xSzoQJz5vLqrqWVYuUt/PS6U1QrEiUHatTbOdk4rtyugwfOfX3oCP4fF7QxMWhj/hoGfic+G/UnJD1qM3VNtb6ZV7XZy9LVAM3UAc3zOEZJYAdN4nmo3wbGsSjS9Bvl60ZexcfoJHmyYKCpirjkUH/YNAMlbvLRToWiMCAtF7lifPd8N3rESflgcv37BTFQ73mnlTnkD8VQM5k23btKfnSEF/vK0WI3490qzPNF6uMDE8S5GwmY6kIKopc4pHSwYju4FDCLmdGGpmyDbYWAgWee/TMPRESgq/F7ERcAMEDT/Xf6looC80Q7McmM4iIYzez7VlkH8F4C8GWj9HNoSJccoxZ9HazYy8dRglBvxPCjXpfCVtEIWygIzfECjh5NMO4c2eeC3fwBypF9GFGrD6hG8qYoIeCh0x1VnaBjsG9vo0Zr7wGLGdDwmIZ9Z1CHvmJCMwj6AtO12hLrqizdQJE/loIrQ61xb5C3YpbNLcOaIij/ZWAWGi3Swm03YbMQOEHtRRNzxgkoNmkNMDIIm3NYSTd8lRyQWYiS+PygpEIq8ELkcJUUvC1HuiFtZmjqDmermeASv/iKFLMEmiSdbS4PgjKxJ9Iyh95lPySuOR+MDzmNyApDfd+3oDPvd1hN+TZcOqXqkmoD/WUKwKZU7aSjrhnlJpd5pihVfO4ZB+bZI5QlTRMtOtcfCJ2K1Ag==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4459.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(39860400002)(346002)(396003)(376002)(9686003)(86362001)(54906003)(6916009)(55016002)(33656002)(966005)(52536014)(107886003)(4326008)(7696005)(66446008)(478600001)(5660300002)(66476007)(66946007)(66556008)(64756008)(71200400001)(122000001)(186003)(2906002)(6506007)(8676002)(8936002)(316002)(26005)(76116006)(83380400001)(38100700002)(83323001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?k+li0hohmRV9YRVUIj1C6TmHC+xDTWM9AZNKQ1k8OgaPPgR7z8rL8q7djqHT?=
 =?us-ascii?Q?LYFK6acc8zZeNb5dGpfRnDVwWVmIhMq4/wNvI3b0b5OOQbHfOIsPCSBn6+al?=
 =?us-ascii?Q?Z3sLSoe+qJBgVPfJcgLLnM3jb3ZVx7aJaPyIL7R16G1XErgwNMQIfwsoOPu/?=
 =?us-ascii?Q?7neQ8t742kbpxq9enOe4ngvS7xbOmMsIRUJJ/OOiNuumrTYmDdwxOdbfZIEu?=
 =?us-ascii?Q?4htTMDF0oipymZ26PkTjMjUtSI4pc3Vg3dpirf0oUFlip7M4x/yzTAfkva0X?=
 =?us-ascii?Q?p7XV/rbQJuRxNK9OpUdWgGYReE3294EDppxnCUjk4x0QB+DdOXws+DU6YvEY?=
 =?us-ascii?Q?Tu0Uv3WXAETsslhpEir5iVUCCxiYpZKLDBAo1HIwZQxfEAxqf9HSV6Mpn3wK?=
 =?us-ascii?Q?hexgY+9K2L3lkXmAnJDveixioFiYTcgICzWs6aRqStB9GSWyCc0Fpn+Ziv9s?=
 =?us-ascii?Q?9pnSiZCaKci4oolIa537Qpfh8+hbctJ0vIRFhKzm0nZY4ETnXanDi/68NTm2?=
 =?us-ascii?Q?CYk8vxeQWKA8klVAfDvSWJfGci0fqor9uVqW8uc0mtYNIyVUszfDbre9w+gh?=
 =?us-ascii?Q?KtQHLFDHtBfF9dzP81UWKgmJV76KgpwteBjucR0WKxoPMdGpOw+pTHMCjfbM?=
 =?us-ascii?Q?KlEvfXx0f3vjM7+cl9DspvVbC3X/VpijtAzKHE+4sz535hrbwlLxFDLfknX2?=
 =?us-ascii?Q?jqhrOqKSuoO+wK7LrTHUmjjoT1qzA5nZp+I80wsp2mH1LBiJf+Seusz90T+D?=
 =?us-ascii?Q?XvZJI2MzDYPDe6tRnVTRf0Nh2X8gk1Ziffhth1UkC0OCCfzmWjIoVVEwBJKD?=
 =?us-ascii?Q?Lks+wkCK6TvN1cfDU9bNHBilydOM0EFo1Ri9selFB53wI37URcr5So52P1+8?=
 =?us-ascii?Q?+ff+cK/W2WWmDdvGRhc66Nrt9MRZ3EvtinIi9E9Nr4uoxGG+oe3Qt3zGP7WE?=
 =?us-ascii?Q?oyXiP7W1u5Hs0TBO3EQTmINygFXsGIo9WX7EwqB8BvKJJbffYJjrJebsxQ9z?=
 =?us-ascii?Q?kIo1YBLSrA19NxakT995Q+j3mi+p4zdfZEHgd/47qvDhJ8bQWAA8R2wMfFeW?=
 =?us-ascii?Q?0dk0ooqOzIbocWfRzyYk4zAjwxH4aZ1kCP+K++mrgS3SaOim0E9eeG6YlHau?=
 =?us-ascii?Q?+2hOs3aeLzYAf4PR/3tXgMOjOkiTtWPrgOjDKfov70k2htWpkSu47JtMAgQw?=
 =?us-ascii?Q?ypoRK2txnGl5OSitPKkx1PaZrFADDStbD6XGE6pti3oYobYSQTUUmSsQxHpy?=
 =?us-ascii?Q?vBVyvp2um5MTjDw+QGTGPvDMt8lN83+CiFD0f9Pt6qf+vPothgXZDQOHcE22?=
 =?us-ascii?Q?vCM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4459.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53320397-3a22-4f5e-b61a-08d930f39d95
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2021 18:21:52.6804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NBK5tXBrWQeo7KG5aDEKu9jumOgRAtUXLCek2iYuzAW7isPS+jysQXcIWpWv1F4vHuhiJErZTaxKjAuKYRiHjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0224
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

Thanks for your initial comments and feedback!

From: Rob Herring <robh@kernel.org>
Date: qua, jun 16, 2021 at 00:40:48

> On Wed, Jun 02, 2021 at 01:24:20PM +0200, Nelson Costa wrote:
> > Document the device tree bindings for the Synopsys DesignWare HDMI RX
> > Controller.
> >=20
> > Signed-off-by: Jose Abreu <jose.abreu@synopsys.com>
> > Signed-off-by: Nelson Costa <nelson.costa@synopsys.com>
> > ---
> >  .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml | 98 ++++++++++++++=
++++++++
> >  1 file changed, 98 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdm=
i-rx.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.ya=
ml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > new file mode 100644
> > index 0000000..4f2169e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > @@ -0,0 +1,98 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://urldefense.com/v3/__http://devicetree.org/schemas/media/s=
nps,dw-hdmi-rx.yaml*__;Iw!!A4F2R9G_pg!PXFG6mDuYYepSE77ynbfBUqpXfgW5g0UdVsjQ=
5p0CEVGkNknkcWScmrRWLFWmhWsFl4$=20
> > +$schema: https://urldefense.com/v3/__http://devicetree.org/meta-schema=
s/core.yaml*__;Iw!!A4F2R9G_pg!PXFG6mDuYYepSE77ynbfBUqpXfgW5g0UdVsjQ5p0CEVGk=
NknkcWScmrRWLFWXz21yII$=20
> > +
> > +title: Synopsys DesignWare HDMI RX Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Jose Abreu <jose.abreu@synopsys.com>
> > +  - Nelson Costa <nelson.costa@synopsys.com>
> > +
> > +description: |
> > +  The Synopsys DesignWare HDMI RX Controller and PHYs e405/e406 is an =
HDMI 2.0
> > +  Receiver solution that is able to decode video and audio.
> > +
> > +properties:
> > +  compatible:
> > +    const: snps,dw-hdmi-rx
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description: |
> > +      phandle to the configuration clock
> > +
> > +  clock-names:
> > +    const: cfg
> > +
> > +  phys:
> > +    maxItems: 1
> > +    description: |
> > +      phandle for the HDMI RX PHY
> > +
> > +  phy-names:
> > +    const: hdmi-phy
>=20
> You don't need *-names when there is only one generally.
>=20

But we are using the PHY API function "devm_phy_get(dw_dev->dev,=20
"hdmi-phy")" in the controller driver in order to get the reference for=20
the PHY.
And looking at the PHY API internal implementation (function "phy_get()"=20
that is called by "devm_phy_get()") seems that this 'phy-names' property=20
is required to get that PHY reference.

> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description: |
> > +      Input port node, multiple endpoints describing the HDMI RX data =
connected
> > +      to the HDMI PHY receiver.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - phys
> > +  - phy-names
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    hdmi_rx: hdmi-rx@0 {
> > +        compatible =3D "snps,dw-hdmi-rx";
> > +        reg =3D <0x0 0x10000>;
> > +        interrupts =3D <1 2>;
> > +
> > +        clocks =3D <&dw_hdmi_refclk>;
> > +        clock-names =3D "cfg";
> > +
> > +        phys =3D <&hdmi_e406_phy>;
> > +        phy-names =3D "hdmi-phy";
> > +
> > +        port {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            hdmi_rx_0: endpoint@0 {
> > +                reg =3D <0>;
> > +                remote-endpoint =3D <&hdmi_e406_phy_0>;
> > +            };
>=20
> I don't get why you have a connection to the phy with 'phys' and OF=20
> graph? The connection should be to the remote device generating the HDMI=
=20
> data with a PHY being somewhat transparent to that data flow.
>=20

Would be possible to give an example for our specific use case?
Or there is any good example, similar to this use case, that we can take=20
a look?
Having in mind that we have two drivers one for the PHY e405/e406 and=20
other for the Controller HDMI RX and a device tree specified for each one=20
(patches [1/9] and [2/9]).

The pipeline is something like this:
HDMI Source (which is an external hot pluggable device) -> PHY e405/e406=20
-> CTRL HDMI RX

Thanks a lot,

BR,

Nelson Costa

> > +
> > +            hdmi_rx_1: endpoint@1 {
> > +                reg =3D <1>;
> > +                remote-endpoint =3D <&hdmi_e406_phy_1>;
> > +            };
> > +
> > +            hdmi_rx_2: endpoint@2 {
> > +                reg =3D <2>;
> > +                remote-endpoint =3D <&hdmi_e406_phy_2>;
> > +            };
> > +
> > +            hdmi_rx_3: endpoint@3 {
> > +                reg =3D <3>;
> > +                remote-endpoint =3D <&hdmi_e406_phy_3>;
> > +            };
> > +        };
> > +    };
> > --=20
> > 2.7.4


