Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26EEC5A4D6E
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 15:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbiH2NRu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 29 Aug 2022 09:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbiH2NRH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Aug 2022 09:17:07 -0400
Received: from mgw1.skoda-auto.cz (mgw1.skoda-auto.cz [193.108.106.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3EF6F584
        for <linux-media@vger.kernel.org>; Mon, 29 Aug 2022 06:16:29 -0700 (PDT)
X-AuditID: 0ad97bd3-dab727000000627e-64-630ca2dc6be1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1BnIU+RS0WCA4jXBLtPOa5RWtnFydDS11Gc4R5gJ7y9KAfm6Vx/dEGAIQzVYOKq+kJWvRIQ6cL/AkaJQX0jDa6kDl5M2Dt2lwmyqjYM+ay4+zY+4Gb9TReYDxlqF2x+xYPviaUF0LULPPR7roFYDK7wtnNGkTFS+FMBC5qtAmgf/SZ4nkyVzjPC1V7YvxOuyfckhSq2YcsA1HIHN9ZRm2i79Ly+ahYVRQy4ygxdKvLSXEm+7cJQwctextNA5NogUeQ9maYaAvq6Uhd2FxJSUtDCG1Gc624z576T69GgfwsL7i4xwDtfef+Yhz5RDhAUxOUrdd92oUi1ztOvBy/XbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZjN8j+mp6jXwJ80DJ6z0MQeitFjbnjSPOc8MJL1WYg=;
 b=fWIVNbihcUlqjkSM7lVwKRgqtiksf15Q/fzAJ4erjDbYyqgWGwutJaJnZ8A1viP0dM9DoUnsVyacdBevmS0MP5LAFgVP/54X3DcpINx1EuB3pCmbwSJRUBniEAENWWUfoI8pUdufHfKsLe1fk1u4K7EoVU7eOa7Js0uIqfvEezUVHxxTUj71pAgmU3q64UoYr9r2Z3lB1FZnwZxd7sZjLCnbmxSip5/EfEEwtcHz+6wttHGa3AphWPV7SovZ9cqI6iDdYMMgN8Md4ypcS1QQvjOEpanoiyGuAuo1b+YYtoeRimyvJyXHnG9yE6hUOC+5E1J9r7HF0AiF+DksSdq/aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digiteqautomotive.com; dmarc=pass action=none
 header.from=digiteqautomotive.com; dkim=pass header.d=digiteqautomotive.com;
 arc=none
From:   "Tuma, Martin (Digiteq Automotive)" 
        <Martin.Tuma@digiteqautomotive.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH 2/3] Added Xilinx PCIe DMA IP core driver
Thread-Topic: [PATCH 2/3] Added Xilinx PCIe DMA IP core driver
Thread-Index: AQHYtlB0rAV1wpLUzkq9iS8nnMGQe63EcLkAgAFB0L4=
Date:   Mon, 29 Aug 2022 11:28:24 +0000
Message-ID: <AM8PR05MB7235B6CBA34C981D456F74EAFB769@AM8PR05MB7235.eurprd05.prod.outlook.com>
References: <20220822194721.1238-1-martin.tuma@digiteqautomotive.com>
 <20220822194721.1238-3-martin.tuma@digiteqautomotive.com>
 <22204e2d-e0cc-b4bf-7501-9e4c2bf32ff8@linaro.org>
In-Reply-To: <22204e2d-e0cc-b4bf-7501-9e4c2bf32ff8@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Enabled=True;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_SiteId=2882be50-2012-4d88-ac86-544124e120c8;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_SetDate=2022-08-29T11:28:24.073Z;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Name=Internal;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_ContentBits=0;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digiteqautomotive.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6250173c-1d9e-4787-7f9c-08da89b19600
x-ms-traffictypediagnostic: DB7PR05MB4954:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kpCVlmJ5LQhArWbw3leqqyAkYeAYd1+eUkN9jfC5VnWKsW70CaH61PpYxKuOwfZi12OarXjFaxwic38Ax1h9zt8PgWsIMzGVs7B4cnJbLN4VduSuqI70N2cIhUZDiEFOMHy1OBo5cPyNauY3atlP20o8Lzm4nHMo1HgliU8Ko7aRSjFbsS6pRT6S9e6Xzrkno01j2balbGc22NQypjs3fR7y5bjRccK1e+Are+0obI+Xjgk1sGv7vmM4Kylb5sS92W8FSVE7sCzk52hAEoN0S9jJDOYBwSf77K0ypZef+qEAuc5qiqUoZA4GvUwrIJpGdB1uPk0DLOOJgeeCbts0d+9wYTPBC4thssWoSllcVT9DNaWOK+THNfBcGveCG8bKDfzL9/rhJPE0NyuJ4cWuy8clJ4jszJvz3AIBXUVJpcoqglZfgs3UIrB8BuxKIjVN5e4Rlcf1bsyeNCQMQdMSMlC/bYqjrb+CZz9vIkRAJuly6M9T7xDyWYNCwqFnfyoonQ3sS6q5GKgpUP9NWDd684WuhzNUKE4rhz6+3Rur7SU4/Hqt0ho/dmZS4T0oh4BeDzdRAtakSnWs7PDQnSSY/anDJ1kXeyVDmmIQ1wraHj0G8BJQR/mTEsyKZTNIJ3xbHQxmH11+TthW1f/OHVyFcUzx9RmktScG57FRNc/5vDaIJmLBakWfkrwmLAmZF2GupqIj1OawjefCzfij4VskUf5H8cgRm/2qiGaCZFck1b5/HQog8sTH/+WZvSTcdbxp74WCwcFBn0k5/V/0Hw68LYAeCyi6DmWxsppDEXdlVtc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR05MB7235.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(64756008)(8676002)(110136005)(66446008)(316002)(76116006)(66946007)(5660300002)(30864003)(2906002)(38100700002)(8936002)(66556008)(66476007)(52536014)(55016003)(53546011)(122000001)(33656002)(86362001)(82960400001)(7696005)(9686003)(6506007)(26005)(71200400001)(966005)(38070700005)(41300700001)(478600001)(83380400001)(186003)(66574015)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?5k3a/haMNyfT0JJOFrVDTVer4XFYXbkBbrqXnAWLpfSpL8WY1t6mwYW7Er?=
 =?iso-8859-2?Q?UwrS15mTwPxUQz45zPllIY6R5bRhku64ql2V0U2rAhIYzTt2GV8dBiqqeZ?=
 =?iso-8859-2?Q?JIEnhw0bJXYfj9O9v69p6ysfutMLqlHNTrrmHLgErnQbl3oK0EyY8gXRUw?=
 =?iso-8859-2?Q?pCn2k0ugIl/hO2Tp3SLZnpyzHBfAxiQZUsRXq4LjGnAqBm2miR8g7iJHad?=
 =?iso-8859-2?Q?mhRgMRa2cChuagr7DNZFT+Zfsgx9N3QMEHrVZiNr69TpNGU5GNFTRtyagl?=
 =?iso-8859-2?Q?JquO7FpNZDHaVNxhawwpk+RreDjHmdnUSBUfYXQnW1JEtRzIkiL6orQMSb?=
 =?iso-8859-2?Q?ZkZq0TsWQ46LKf/gK166BO3iu3KqopCUkeFOASIiqXkJN/QNV7gpV19KX7?=
 =?iso-8859-2?Q?JpxNFJuDAcOsAuMvkFHgeom0fQF3PCij0CNkPXx+GBM9J2d0ilqzc6dGse?=
 =?iso-8859-2?Q?wki/V/wnBG4hY0W5VInAge7Dt20njAEKbnPu7QRJt7ojnoCTljHHwdqX3W?=
 =?iso-8859-2?Q?K5TCiUln5dYGj8AAwG1lzuj7reapIHich2aHoysjYOkIqyK1T/UuUub+Op?=
 =?iso-8859-2?Q?EpssnhhJh/nq2jhRERPXvI0Xkz8EwRFkKCA5Aj8HvWTSnMT9fyofyr4+GR?=
 =?iso-8859-2?Q?gIjnWcLhY/4gz0/uzWoeYO2eWd2+ZWRraHAx/560jlEotUhUWEQAXxwMDC?=
 =?iso-8859-2?Q?JLpMJX03j/jMPV27resCuyeHpL9dlG25PpdWtvNDIgiUIHOiwvPL/2kmYZ?=
 =?iso-8859-2?Q?M94IoxQmlDjfvQHt0UafxaX46hioT7IEcv6Vmy1RfdkE3HR7EvVh5BUHzj?=
 =?iso-8859-2?Q?BXKooVmVbz1TDkR6ajKHZHFEeuuoptv4p5hlcGH52azFilZMZO++XPNiya?=
 =?iso-8859-2?Q?GfJl/nuqnNxFvxxQcmlP+FgOBzoJm4NPJ65GSl5L+uCTePUKZaAh2d1fz8?=
 =?iso-8859-2?Q?+2VwZtxKJEOzzfphUPSCBUhWM0oLZQTwosoNWt3hn4wvlYoBjydZDrF+w6?=
 =?iso-8859-2?Q?qlLVpme8fK7aT5tbAtgo/GZztl1dd8w4WtqfpwyDbVU4+pGbQx1htQO+AH?=
 =?iso-8859-2?Q?K5vYFep0K4s/uQ61G16PRIXfkgrW435+hPHv3W7MwjM8/PvCU98TjPvarS?=
 =?iso-8859-2?Q?iYEt049kwBP/ZKR1zLunfZQr0R3YHEIAd2+vWT6MRDdjJ+QJdrRZcTSXZk?=
 =?iso-8859-2?Q?72wFSkwOXFpb+3yOdMKisb1UBt/cwzdk7gFAdvQoxsBTgrj23rB6NCLi6X?=
 =?iso-8859-2?Q?AoPuScABdk3upH29iI2QLKjZMpJ/Z9IAvQfaJah9gW/rAge1+VTnFwoTLc?=
 =?iso-8859-2?Q?oFfD/lSwKv6ZhND7p8zVzyLt2YwqJbo5ib5DbTwel5GuNGw5YBNRHx7m7q?=
 =?iso-8859-2?Q?PQF+gJW/JeBRWpWBw2j0s7Sqhlyw34tbsVfwIPiM4iuxB/QV4gNOiWf+zS?=
 =?iso-8859-2?Q?Ab5UY3V/AbZe6znX7OLdcebv5xxFsNGNiIrMh1Ob5vLtzUyyw+6Mzh5gec?=
 =?iso-8859-2?Q?m5ZaI7mKoHWwBEmY1KNq9MUCT6LPlKan84Px+FWnCFzpxoZGOPre7hi+K3?=
 =?iso-8859-2?Q?L5cuo1A1p1Uu7yUNPwYFUe1YSOI06wp4WV4jz1y2/FVORo5Jnp8pUWWgHq?=
 =?iso-8859-2?Q?dBZgb+DKBtvijOTukWCODqPObinz7EgGL6aF9n+bKP157MTaoXWr1yvA?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR05MB7235.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6250173c-1d9e-4787-7f9c-08da89b19600
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2022 11:28:24.4709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2882be50-2012-4d88-ac86-544124e120c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xd+yNGwZ0fQLZeKQzyzooDQQuGNsHOntfIhfGdpBwjW9hyrdanccn0HXQ4bov6Yu8wZkOEK446w6LGKtQbxMLfs7YfzNXUaqavb8yfe8OWCp9yAXwwbGC0i/I3GiNPJ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR05MB4954
X-OriginatorOrg: digiteqautomotive.com
X-SGG-UMAMSID: 20220829112827Z13429mxmos08.wob.vw.vwg 1oScwN-0003Ub-Em
X-SGG-RESULT: 20220829112827Z13429mxmos08.wob.vw.vwg C1:OK E1:OK MX1:OK BL:OK SPF:off  CT: CM: SIP:10.186.25.86 SMF:Martin.Tuma@digiteqautomotive.com
X-SGG-MF: Martin.Tuma@digiteqautomotive.com
X-SGG-DKIM-Signing: fe5a965be60fd73f3484b58bce070295
X-OriginalArrivalTime: 29 Aug 2022 11:28:28.0035 (UTC) FILETIME=[75A22D30:01D8BB9A]
X-EEG-SA-PASSED: outgoing
X-EEG-SA-LOOP-COUNT: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42LhulkpqntnEU+ywfML3BY9G7ayOjB6fN4k
        F8AYxW2TlFhSFpyZnqdvl8Cd0dn6nK2gcQFTxb2rfewNjNNuMnYxcnIICehJ3Lm2hRXElhAw
        kehYdB4ozsXBKLCMWWLa6dssUA6rxLGjC9ghnKuMEpP728Da2QR8Jb7fecLWxcjBISJQLjHp
        QixIWFjAVmLZ1PdgJSICdhK31k5ghiixklhyxwDEZBFQleid7wBSwSsQI/Hy7zuoe7YySrxe
        HAdicwJ13lx6jBnEZhQQk/h+ag0TiM0sIC5x68l8JoibBSSW7DnPDGGLSrx8/I8V5Epegc3M
        End/v2OCOLmBUeLr/D6oKlmJS/O7GSFsX4kVh95DxXUlvv3dwQZhy0ms6n3IAmHLS0xb9J4d
        wpaReHBjOxvIUAmB82wSjxb9Y4RwLrNIdKz6ClVlIDHv2xGoqsOCEh9fdrBDHK4n8ezULBYI
        W1ti2cLXzBMYjWYh+WkWkrJZSMpmgcNJUOLkzCcsCxhZVjGKFOcm5aaXG+qllesVZ+enJOqV
        ladvYgQnierLOxjfLTI4xMjEwXiIUYKDWUmE9+sujmQh3pTEyqrUovz4otKc1OJDjNIcLEri
        vJVMV5OEBNITS1KzU1MLUotgskwcnCDdXFIixal5KalFiaUlGfGgNBVfDExUUg2Mrgwl658+
        5t3yjnmurenl3w//s387N617ptvnE3+MAxy3PBD5qBtgYqquutWtaaZq8/7cWm71F3KH7z26
        Ubp5YaD+BY6T5i9W8PSppW/2aFPVzjSpaDP1kSmYKF9z/M7nWZ4V7vZHdML+pJ5g6Fu8WX/p
        t22azhfsPQ77s2kxLpF/4PDy/EVrJZbijERDLeai4kQAVUVh6hsDAAA=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Sent: Sunday, August 28, 2022 4:58 PM
To: Tuma, Martin (Digiteq Automotive) <Martin.Tuma@digiteqautomotive.com>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>
Subject: Re: [PATCH 2/3] Added Xilinx PCIe DMA IP core driver

On 22/08/2022 22:47, martin.tuma@digiteqautomotive.com wrote:
> From: Martin Tùma <martin.tuma@digiteqautomotive.com>
>
> The driver is based on the code provided by Xilinx at
> https://github.com/Xilinx/dma_ip_drivers

>> Explain why this cannot be merged into existing Xilinx dma drivers

The Xilinx XDMA IP core is a complex device that is bound to PCIe and
also handles stuff like MSI/MSI-X interrupts of the PCIe card/FPGA.
The FPGA IP core is different from those that already have drivers in
dma/xilinx so a new dma device would be required anyway.


>
> There are no significant functional changes in the code except
> of separating the core DMA driver functionality in a way that the code
> can be used by device drivers in the kernel.

Use scripts/get_maintainers.pl to CC all maintainers and relevant
mailing lists. Patch will be ignored if you do not follow Linux kernel
process...

Ok, thanks for the info, I have missed this in all the "how to submit
a patch to linux" info one has to go through.

>
> Signed-off-by: Martin Tùma <martin.tuma@digiteqautomotive.com>
> ---
>  drivers/dma/Kconfig               |    7 +
>  drivers/dma/xilinx/Makefile       |    2 +
>  drivers/dma/xilinx/xdma_core.c    | 3835 +++++++++++++++++++++++++++++
>  drivers/dma/xilinx/xdma_core.h    |  588 +++++
>  drivers/dma/xilinx/xdma_thread.c  |  309 +++
>  drivers/dma/xilinx/xdma_thread.h  |  134 +
>  drivers/dma/xilinx/xdma_version.h |   23 +
>  include/linux/dma/xilinx_xdma.h   |   91 +
>  8 files changed, 4989 insertions(+)
>  create mode 100644 drivers/dma/xilinx/xdma_core.c
>  create mode 100644 drivers/dma/xilinx/xdma_core.h
>  create mode 100644 drivers/dma/xilinx/xdma_thread.c
>  create mode 100644 drivers/dma/xilinx/xdma_thread.h
>  create mode 100644 drivers/dma/xilinx/xdma_version.h
>  create mode 100644 include/linux/dma/xilinx_xdma.h
>
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 487ed4ddc3be..e37578a5d94e 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -793,6 +793,13 @@ config DMATEST
>          Simple DMA test client. Say N unless you're debugging a
>          DMA Device driver.
>
> +config XILINX_XDMA
> +     tristate "Xilinx XDMA Engine"
> +     depends on PCI
> +     select DMA_ENGINE
> +     help
> +       Enable support for Xilinx XDMA IP controller.
> +
>  config DMA_ENGINE_RAID
>        bool
>
> diff --git a/drivers/dma/xilinx/Makefile b/drivers/dma/xilinx/Makefile
> index 767bb45f641f..890c9c04e3c7 100644
> --- a/drivers/dma/xilinx/Makefile
> +++ b/drivers/dma/xilinx/Makefile
> @@ -2,3 +2,5 @@
>  obj-$(CONFIG_XILINX_DMA) += xilinx_dma.o
>  obj-$(CONFIG_XILINX_ZYNQMP_DMA) += zynqmp_dma.o
>  obj-$(CONFIG_XILINX_ZYNQMP_DPDMA) += xilinx_dpdma.o
> +obj-$(CONFIG_XILINX_XDMA) += xilinx_xdma.o
> +xilinx_xdma-objs := xdma_core.o xdma_thread.o
> diff --git a/drivers/dma/xilinx/xdma_core.c b/drivers/dma/xilinx/xdma_core.c
> new file mode 100644
> index 000000000000..03f02acb5904
> --- /dev/null
> +++ b/drivers/dma/xilinx/xdma_core.c
> @@ -0,0 +1,3835 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This file is part of the Xilinx DMA IP Core driver for Linux
> + *
> + * Copyright (c) 2016-present,  Xilinx, Inc.
> + * Copyright (c) 2020-present,  Digiteq Automotive s.r.o.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/string.h>
> +#include <linux/mm.h>
> +#include <linux/errno.h>
> +#include <linux/sched.h>
> +#include <linux/vmalloc.h>
> +#include <linux/dma/xilinx_xdma.h>
> +#include "xdma_core.h"
> +#include "xdma_thread.h"
> +#include "xdma_version.h"
> +
> +#define DRV_MODULE_NAME "xdma"
> +#define DRV_MODULE_DESC "Xilinx XDMA Base Driver"
> +#define DRV_MODULE_RELDATE "04/2021"
> +
> +static char version[] =
> +     DRV_MODULE_DESC " " DRV_MODULE_NAME " v" DRV_MODULE_VERSION "\n";
> +
> +MODULE_AUTHOR("Xilinx, Inc.");
> +MODULE_DESCRIPTION(DRV_MODULE_DESC);
> +MODULE_VERSION(DRV_MODULE_VERSION);
> +MODULE_LICENSE("Dual BSD/GPL");
> +
> +/* Module Parameters */
> +static unsigned int poll_mode;
> +module_param(poll_mode, uint, 0644);
> +MODULE_PARM_DESC(poll_mode, "Set 1 for hw polling, default is 0 (interrupts)");
> +
> +static unsigned int interrupt_mode;
> +module_param(interrupt_mode, uint, 0644);
> +MODULE_PARM_DESC(interrupt_mode, "0 - Auto, 1 - MSI, 2 - MSI-x");
> +
> +static unsigned int enable_credit_mp = 1;
> +module_param(enable_credit_mp, uint, 0644);
> +MODULE_PARM_DESC(enable_credit_mp,
> +              "Set 0 to disable credit feature, default is 1 (credit control enabled)");
> +
> +static unsigned int desc_blen_max = XDMA_DESC_BLEN_MAX;
> +module_param(desc_blen_max, uint, 0644);
> +MODULE_PARM_DESC(desc_blen_max,
> +              "per descriptor max. buffer length, default is (1 << 28) - 1");
> +
> +/*
> + * xdma device management
> + * maintains a list of the xdma devices
> + */
> +static LIST_HEAD(xdev_list);
> +static DEFINE_MUTEX(xdev_mutex);
> +
> +static LIST_HEAD(xdev_rcu_list);
> +static DEFINE_SPINLOCK(xdev_rcu_lock);

>> No static variables... Why do you need them?

Good point. Looks the only reason it is there is some weird debug checking.
I will have a look at it and eventualy remove all of the related stuff.

> +
> +static inline int xdev_list_add(struct xdma_dev *xdev)
> +{
> +     mutex_lock(&xdev_mutex);
> +     if (list_empty(&xdev_list)) {
> +             xdev->idx = 0;
> +             if (poll_mode) {
> +                     int rv = xdma_threads_create(xdev->h2c_channel_max +
> +                                     xdev->c2h_channel_max);
> +                     if (rv < 0) {
> +                             mutex_unlock(&xdev_mutex);
> +                             return rv;
> +                     }
> +             }
> +     } else {
> +             struct xdma_dev *last;
> +
> +             last = list_last_entry(&xdev_list, struct xdma_dev, list_head);
> +             xdev->idx = last->idx + 1;
> +     }
> +     list_add_tail(&xdev->list_head, &xdev_list);
> +     mutex_unlock(&xdev_mutex);
> +
> +     dbg_init("dev %s, xdev 0x%p, xdma idx %d.\n",
> +              dev_name(&xdev->pdev->dev), xdev, xdev->idx);
> +
> +     spin_lock(&xdev_rcu_lock);
> +     list_add_tail_rcu(&xdev->rcu_node, &xdev_rcu_list);
> +     spin_unlock(&xdev_rcu_lock);
> +
> +     return 0;
> +}
> +
> +static inline void xdev_list_remove(struct xdma_dev *xdev)
> +{
> +     mutex_lock(&xdev_mutex);
> +     list_del(&xdev->list_head);
> +     if (poll_mode && list_empty(&xdev_list))
> +             xdma_threads_destroy();
> +     mutex_unlock(&xdev_mutex);
> +
> +     spin_lock(&xdev_rcu_lock);
> +     list_del_rcu(&xdev->rcu_node);
> +     spin_unlock(&xdev_rcu_lock);
> +     synchronize_rcu();
> +}
> +
> +static struct xdma_dev *xdev_find_by_pdev(struct pci_dev *pdev)
> +{
> +     struct xdma_dev *xdev, *tmp;
> +
> +     mutex_lock(&xdev_mutex);
> +     list_for_each_entry_safe(xdev, tmp, &xdev_list, list_head) {
> +             if (xdev->pdev == pdev) {
> +                     mutex_unlock(&xdev_mutex);
> +                     return xdev;
> +             }
> +     }
> +     mutex_unlock(&xdev_mutex);
> +     return NULL;
> +}
> +
> +static inline int debug_check_dev_hndl(const char *fname, struct pci_dev *pdev,
> +                                    void *hndl)
> +{
> +     struct xdma_dev *xdev;
> +
> +     if (!pdev)
> +             return -EINVAL;
> +
> +     xdev = xdev_find_by_pdev(pdev);
> +     if (!xdev) {
> +             pr_info("%s pdev 0x%p, hndl 0x%p, NO match found!\n", fname,
> +                     pdev, hndl);
> +             return -EINVAL;
> +     }
> +     if (xdev != hndl) {
> +             pr_err("%s pdev 0x%p, hndl 0x%p != 0x%p!\n", fname, pdev, hndl,
> +                    xdev);
> +             return -EINVAL;
> +     }
> +
> +     return 0;
> +}
> +
> +#ifdef __LIBXDMA_DEBUG__

>> What is this?

Looks like some weird debug checking... As already mentioned above, I will
check this and clean up the code.

> +/* SECTION: Function definitions */
> +inline void __write_register(const char *fn, u32 value, void *iomem,
> +                          unsigned long off)
> +{
> +     pr_err("%s: w reg 0x%lx(0x%p), 0x%x.\n", fn, off, iomem, value);
> +     iowrite32(value, iomem);
> +}
> +#define write_register(v, mem, off) __write_register(__func__, v, mem, off)
> +#else
> +#define write_register(v, mem, off) iowrite32(v, mem)
> +#endif
> +
> +inline u32 read_register(void *iomem)
> +{
> +     return ioread32(iomem);

>> Just use ioread32, no silly wrappers. Actually, I think it should be
>> readl/readw/readb and so on...

Ok.

> +}
> +
> +static inline u32 build_u32(u32 hi, u32 lo)
> +{
> +     return ((hi & 0xFFFFUL) << 16) | (lo & 0xFFFFUL);
> +}
> +
> +static inline u64 build_u64(u64 hi, u64 lo)
> +{
> +     return ((hi & 0xFFFFFFFULL) << 32) | (lo & 0xFFFFFFFFULL);
> +}
> +
> +static void check_nonzero_interrupt_status(struct xdma_dev *xdev)
> +{
> +     struct interrupt_regs *reg =
> +             (struct interrupt_regs *)(xdev->bar[xdev->config_bar_idx] +
> +                                       XDMA_OFS_INT_CTRL);
> +     u32 w;
> +
> +     w = read_register(&reg->user_int_enable);
> +     if (w)
> +             pr_info("%s xdma%d user_int_enable = 0x%08x\n",
> +                     dev_name(&xdev->pdev->dev), xdev->idx, w);

>> prints on interrupts? No, this kills dmesg.

will fix that

>> Sorry, you try to push some vendor code, instead of merging to existing
>> drivers and using Linux coding style. I'll skip parts here - you need to
>> work on it. :/

Yes, the idea was to make a new DMA driver from as much "original" Xilinx code
as possible. There are definitely things that can be improved and I will do a new
cleanup/rewrite if there are no other serious objections (about the principle how
the driver works or it's API) than the "formal code quality".

> +int xdma_kthread_stop(struct xdma_kthread *thp)
> +{
> +     int rv;
> +
> +     if (!thp->task) {
> +             pr_debug_thread("kthread %s, already stopped.\n", thp->name);
> +             return 0;
> +     }
> +
> +     thp->schedule = 1;
> +     rv = kthread_stop(thp->task);
> +     if (rv < 0) {
> +             pr_warn("kthread %s, stop err %d.\n", thp->name, rv);
> +             return rv;
> +     }
> +
> +     pr_debug_thread("kthread %s, 0x%p, stopped.\n", thp->name, thp->task);
> +     thp->task = NULL;
> +
> +     return 0;
> +}
> +
> +
> +

Code needs cleanup...

(...)

> diff --git a/drivers/dma/xilinx/xdma_thread.h b/drivers/dma/xilinx/xdma_thread.h
> new file mode 100644
> index 000000000000..508dd4c4c890
> --- /dev/null
> +++ b/drivers/dma/xilinx/xdma_thread.h
> @@ -0,0 +1,134 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This file is part of the Xilinx DMA IP Core driver for Linux
> + *
> + * Copyright (c) 2017-present,  Xilinx, Inc.

>> Present? There is no such year.

Will fix that. Like all the stuff above, the origin is the original Xilinx code.

> + */
> +
> +#ifndef XDMA_THREAD_H
> +#define XDMA_THREAD_H
> +/**
> + * @file

>> Is it standard kerneldoc comment?
Will fix that.

> + * @brief This file contains the declarations for xdma kernel threads
> + *
> + */
> +#include <linux/version.h>
> +#include <linux/spinlock.h>
> +#include <linux/kthread.h>
> +#include <linux/cpuset.h>
> +#include <linux/signal.h>
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/uaccess.h>
> +#include <linux/errno.h>
> +#include "xdma_core.h"
> +
> +#ifdef DEBUG_THREADS
> +#define lock_thread(thp)     \
> +     do { \
> +             pr_debug("locking thp %s ...\n", (thp)->name); \
> +             spin_lock(&(thp)->lock); \
> +     } while (0)
> +
> +#define unlock_thread(thp)   \
> +     do { \
> +             pr_debug("unlock thp %s ...\n", (thp)->name); \
> +             spin_unlock(&(thp)->lock); \
> +     } while (0)
> +
> +#define xdma_kthread_wakeup(thp)     \
> +     do { \
> +             pr_info("signaling thp %s ...\n", (thp)->name); \
> +             wake_up_process((thp)->task); \
> +     } while (0)
> +
> +#define pr_debug_thread(fmt, ...) pr_info(fmt, __VA_ARGS__)
> +
> +#else
> +/** lock thread macro */
> +#define lock_thread(thp)             spin_lock(&(thp)->lock)
> +/** un lock thread macro */
> +#define unlock_thread(thp)           spin_unlock(&(thp)->lock)
> +#define xdma_kthread_wakeup(thp) \
> +     do { \
> +             thp->schedule = 1; \
> +             wake_up_interruptible(&thp->waitq); \
> +     } while (0)
> +/** pr_debug_thread */
> +#define pr_debug_thread(fmt, ...)
> +#endif
> +
> +/**
> + * @struct - xdma_kthread
> + * @brief    xdma thread book keeping parameters
> + */
> +struct xdma_kthread {
> +     /**  thread lock*/

>>Weird comment style. Use Linux kernel coding style comments. In this
>> case - use proper kerneldoc.

Ok.

> +     spinlock_t lock;
> +     /**  name of the thread */
> +     char name[16];
> +     /**  cpu number for which the thread associated with */
> +     unsigned short cpu;
> +     /**  thread id */
> +     unsigned short id;
> +     /**  thread sleep timeout value */
> +     unsigned int timeout;
> +     /**  flags for thread */
> +     unsigned long flag;
> +     /**  thread wait queue */
> +     wait_queue_head_t waitq;
> +     /* flag to indicate scheduling of thread */
> +     unsigned int schedule;
> +     /**  kernel task structure associated with thread*/
> +     struct task_struct *task;
> +     /**  thread work list count */
> +     unsigned int work_cnt;
> +     /**  thread work list count */
> +     struct list_head work_list;
> +     /**  thread initialization handler */
> +     int (*finit)(struct xdma_kthread *thread);
> +     /**  thread pending handler */
> +     int (*fpending)(struct list_head *list);
> +     /**  thread peocessing handler */
> +     int (*fproc)(struct list_head *list);
> +     /**  thread done handler */
> +     int (*fdone)(struct xdma_kthread *thread);
> +};
> +
> +
> +/*****************************************************************************/

>> Weird comment style. Use Linux kernel coding style comments.
Ok.

> +/**
> + * xdma_threads_create() - create xdma threads
> + *****************************************************************************/
> +int xdma_threads_create(unsigned int num_threads);
> +
> +/*****************************************************************************/
> +/**
> + * xdma_threads_destroy() - destroy all the xdma threads created
> + *                          during system initialization
> + *
> + * @return   none
> + *****************************************************************************/
> +void xdma_threads_destroy(void);
> +
> +/*****************************************************************************/
> +/**
> + * xdma_thread_remove_work() - handler to remove the attached work thread
> + *
> + * @param[in]        engine: pointer to xdma_engine
> + *
> + * @return   none
> + *****************************************************************************/
> +void xdma_thread_remove_work(struct xdma_engine *engine);
> +
> +/*****************************************************************************/
> +/**
> + * xdma_thread_add_work() - handler to add a work thread
> + *
> + * @param[in]        engine: pointer to xdma_engine
> + *
> + * @return   none
> + *****************************************************************************/
> +void xdma_thread_add_work(struct xdma_engine *engine);
> +
> +#endif /* XDMA_THREAD_H */
> diff --git a/drivers/dma/xilinx/xdma_version.h b/drivers/dma/xilinx/xdma_version.h
> new file mode 100644
> index 000000000000..bd061b6bc513
> --- /dev/null
> +++ b/drivers/dma/xilinx/xdma_version.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This file is part of the Xilinx DMA IP Core driver for Linux
> + *
> + * Copyright (c) 2016-present,  Xilinx, Inc.

> + */
> +
> +#ifndef XDMA_VERSION_H
> +#define XDMA_VERSION_H
> +
> +#define DRV_MOD_MAJOR                2021
> +#define DRV_MOD_MINOR                4
> +#define DRV_MOD_PATCHLEVEL   1

>> What's that? We do not version drivers in Linux kernel. Entire header
>> should be removed.

Ok. I will remove all the versioning stuff.

> +
> +#define DRV_MODULE_VERSION      \
> +     __stringify(DRV_MOD_MAJOR) "." \
> +     __stringify(DRV_MOD_MINOR) "." \
> +     __stringify(DRV_MOD_PATCHLEVEL)
> +
> +#define DRV_MOD_VERSION_NUMBER  \
> +     ((DRV_MOD_MAJOR)*1000 + (DRV_MOD_MINOR)*100 + DRV_MOD_PATCHLEVEL)
> +
> +#endif /* XDMA_VERSION_H */
> diff --git a/include/linux/dma/xilinx_xdma.h b/include/linux/dma/xilinx_xdma.h
> new file mode 100644
> index 000000000000..4a0c3e02ec6f
> --- /dev/null
> +++ b/include/linux/dma/xilinx_xdma.h
> @@ -0,0 +1,91 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This file is part of the Xilinx DMA IP Core driver for Linux
> + *
> + * Copyright (c) 2016-present,  Xilinx, Inc.
> + * Copyright (c) 2020-present,  Digiteq Automotive s.r.o.
> + */
> +
> +#ifndef XILINX_XDMA_H
> +#define XILINX_XDMA_H
> +
> +#include <linux/types.h>
> +#include <linux/scatterlist.h>
> +#include <linux/interrupt.h>
> +
> +/*
> + * xdma_device_open - read the pci bars and configure the fpga
> + *   should be called from probe()
> + *   NOTE: user interrupt will not enabled until xdma_user_isr_enable() is called
> + *
> + * @pdev: ptr to pci_dev

>> Is it kerneldoc or not? If it is, make it proper kerneldoc.
Ok.

> + * @mod_name: the module name to be used for request_irq
> + * @user_max: max # of user/event (interrupts) to be configured
> + * @channel_max: max # of c2h and h2c channels to be configured
> + *   NOTE: if the user/channel provisioned is less than the max specified,
> + *   libxdma will update the user_max/channel_max
> + *
> + * returns a opaque handle (for libxdma to identify the device) NULL, in case of
> + * error
> + */
> +void *xdma_device_open(const char *mod_name, struct pci_dev *pdev,
> +              int *user_max, int *h2c_channel_max, int *c2h_channel_max);
> +

Best regards,
Krzysztof


From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Sent: Sunday, August 28, 2022 4:58 PM
To: Tuma, Martin (Digiteq Automotive) <Martin.Tuma@digiteqautomotive.com>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>
Subject: Re: [PATCH 2/3] Added Xilinx PCIe DMA IP core driver

On 22/08/2022 22:47, martin.tuma@digiteqautomotive.com wrote:
> From: Martin Tùma <martin.tuma@digiteqautomotive.com>
>
> The driver is based on the code provided by Xilinx at
> https://github.com/Xilinx/dma_ip_drivers

Explain why this cannot be merged into existing Xilinx dma drivers

>
> There are no significant functional changes in the code except
> of separating the core DMA driver functionality in a way that the code
> can be used by device drivers in the kernel.

Use scripts/get_maintainers.pl to CC all maintainers and relevant
mailing lists. Patch will be ignored if you do not follow Linux kernel
process...

>
> Signed-off-by: Martin Tùma <martin.tuma@digiteqautomotive.com>
> ---
>  drivers/dma/Kconfig               |    7 +
>  drivers/dma/xilinx/Makefile       |    2 +
>  drivers/dma/xilinx/xdma_core.c    | 3835 +++++++++++++++++++++++++++++
>  drivers/dma/xilinx/xdma_core.h    |  588 +++++
>  drivers/dma/xilinx/xdma_thread.c  |  309 +++
>  drivers/dma/xilinx/xdma_thread.h  |  134 +
>  drivers/dma/xilinx/xdma_version.h |   23 +
>  include/linux/dma/xilinx_xdma.h   |   91 +
>  8 files changed, 4989 insertions(+)
>  create mode 100644 drivers/dma/xilinx/xdma_core.c
>  create mode 100644 drivers/dma/xilinx/xdma_core.h
>  create mode 100644 drivers/dma/xilinx/xdma_thread.c
>  create mode 100644 drivers/dma/xilinx/xdma_thread.h
>  create mode 100644 drivers/dma/xilinx/xdma_version.h
>  create mode 100644 include/linux/dma/xilinx_xdma.h
>
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 487ed4ddc3be..e37578a5d94e 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -793,6 +793,13 @@ config DMATEST
>          Simple DMA test client. Say N unless you're debugging a
>          DMA Device driver.
>
> +config XILINX_XDMA
> +     tristate "Xilinx XDMA Engine"
> +     depends on PCI
> +     select DMA_ENGINE
> +     help
> +       Enable support for Xilinx XDMA IP controller.
> +
>  config DMA_ENGINE_RAID
>        bool
>
> diff --git a/drivers/dma/xilinx/Makefile b/drivers/dma/xilinx/Makefile
> index 767bb45f641f..890c9c04e3c7 100644
> --- a/drivers/dma/xilinx/Makefile
> +++ b/drivers/dma/xilinx/Makefile
> @@ -2,3 +2,5 @@
>  obj-$(CONFIG_XILINX_DMA) += xilinx_dma.o
>  obj-$(CONFIG_XILINX_ZYNQMP_DMA) += zynqmp_dma.o
>  obj-$(CONFIG_XILINX_ZYNQMP_DPDMA) += xilinx_dpdma.o
> +obj-$(CONFIG_XILINX_XDMA) += xilinx_xdma.o
> +xilinx_xdma-objs := xdma_core.o xdma_thread.o
> diff --git a/drivers/dma/xilinx/xdma_core.c b/drivers/dma/xilinx/xdma_core.c
> new file mode 100644
> index 000000000000..03f02acb5904
> --- /dev/null
> +++ b/drivers/dma/xilinx/xdma_core.c
> @@ -0,0 +1,3835 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This file is part of the Xilinx DMA IP Core driver for Linux
> + *
> + * Copyright (c) 2016-present,  Xilinx, Inc.
> + * Copyright (c) 2020-present,  Digiteq Automotive s.r.o.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/string.h>
> +#include <linux/mm.h>
> +#include <linux/errno.h>
> +#include <linux/sched.h>
> +#include <linux/vmalloc.h>
> +#include <linux/dma/xilinx_xdma.h>
> +#include "xdma_core.h"
> +#include "xdma_thread.h"
> +#include "xdma_version.h"
> +
> +#define DRV_MODULE_NAME "xdma"
> +#define DRV_MODULE_DESC "Xilinx XDMA Base Driver"
> +#define DRV_MODULE_RELDATE "04/2021"
> +
> +static char version[] =
> +     DRV_MODULE_DESC " " DRV_MODULE_NAME " v" DRV_MODULE_VERSION "\n";
> +
> +MODULE_AUTHOR("Xilinx, Inc.");
> +MODULE_DESCRIPTION(DRV_MODULE_DESC);
> +MODULE_VERSION(DRV_MODULE_VERSION);
> +MODULE_LICENSE("Dual BSD/GPL");
> +
> +/* Module Parameters */
> +static unsigned int poll_mode;
> +module_param(poll_mode, uint, 0644);
> +MODULE_PARM_DESC(poll_mode, "Set 1 for hw polling, default is 0 (interrupts)");
> +
> +static unsigned int interrupt_mode;
> +module_param(interrupt_mode, uint, 0644);
> +MODULE_PARM_DESC(interrupt_mode, "0 - Auto, 1 - MSI, 2 - MSI-x");
> +
> +static unsigned int enable_credit_mp = 1;
> +module_param(enable_credit_mp, uint, 0644);
> +MODULE_PARM_DESC(enable_credit_mp,
> +              "Set 0 to disable credit feature, default is 1 (credit control enabled)");
> +
> +static unsigned int desc_blen_max = XDMA_DESC_BLEN_MAX;
> +module_param(desc_blen_max, uint, 0644);
> +MODULE_PARM_DESC(desc_blen_max,
> +              "per descriptor max. buffer length, default is (1 << 28) - 1");
> +
> +/*
> + * xdma device management
> + * maintains a list of the xdma devices
> + */
> +static LIST_HEAD(xdev_list);
> +static DEFINE_MUTEX(xdev_mutex);
> +
> +static LIST_HEAD(xdev_rcu_list);
> +static DEFINE_SPINLOCK(xdev_rcu_lock);

No static variables... Why do you need them?

> +
> +static inline int xdev_list_add(struct xdma_dev *xdev)
> +{
> +     mutex_lock(&xdev_mutex);
> +     if (list_empty(&xdev_list)) {
> +             xdev->idx = 0;
> +             if (poll_mode) {
> +                     int rv = xdma_threads_create(xdev->h2c_channel_max +
> +                                     xdev->c2h_channel_max);
> +                     if (rv < 0) {
> +                             mutex_unlock(&xdev_mutex);
> +                             return rv;
> +                     }
> +             }
> +     } else {
> +             struct xdma_dev *last;
> +
> +             last = list_last_entry(&xdev_list, struct xdma_dev, list_head);
> +             xdev->idx = last->idx + 1;
> +     }
> +     list_add_tail(&xdev->list_head, &xdev_list);
> +     mutex_unlock(&xdev_mutex);
> +
> +     dbg_init("dev %s, xdev 0x%p, xdma idx %d.\n",
> +              dev_name(&xdev->pdev->dev), xdev, xdev->idx);
> +
> +     spin_lock(&xdev_rcu_lock);
> +     list_add_tail_rcu(&xdev->rcu_node, &xdev_rcu_list);
> +     spin_unlock(&xdev_rcu_lock);
> +
> +     return 0;
> +}
> +
> +static inline void xdev_list_remove(struct xdma_dev *xdev)
> +{
> +     mutex_lock(&xdev_mutex);
> +     list_del(&xdev->list_head);
> +     if (poll_mode && list_empty(&xdev_list))
> +             xdma_threads_destroy();
> +     mutex_unlock(&xdev_mutex);
> +
> +     spin_lock(&xdev_rcu_lock);
> +     list_del_rcu(&xdev->rcu_node);
> +     spin_unlock(&xdev_rcu_lock);
> +     synchronize_rcu();
> +}
> +
> +static struct xdma_dev *xdev_find_by_pdev(struct pci_dev *pdev)
> +{
> +     struct xdma_dev *xdev, *tmp;
> +
> +     mutex_lock(&xdev_mutex);
> +     list_for_each_entry_safe(xdev, tmp, &xdev_list, list_head) {
> +             if (xdev->pdev == pdev) {
> +                     mutex_unlock(&xdev_mutex);
> +                     return xdev;
> +             }
> +     }
> +     mutex_unlock(&xdev_mutex);
> +     return NULL;
> +}
> +
> +static inline int debug_check_dev_hndl(const char *fname, struct pci_dev *pdev,
> +                                    void *hndl)
> +{
> +     struct xdma_dev *xdev;
> +
> +     if (!pdev)
> +             return -EINVAL;
> +
> +     xdev = xdev_find_by_pdev(pdev);
> +     if (!xdev) {
> +             pr_info("%s pdev 0x%p, hndl 0x%p, NO match found!\n", fname,
> +                     pdev, hndl);
> +             return -EINVAL;
> +     }
> +     if (xdev != hndl) {
> +             pr_err("%s pdev 0x%p, hndl 0x%p != 0x%p!\n", fname, pdev, hndl,
> +                    xdev);
> +             return -EINVAL;
> +     }
> +
> +     return 0;
> +}
> +
> +#ifdef __LIBXDMA_DEBUG__

What is this?

> +/* SECTION: Function definitions */
> +inline void __write_register(const char *fn, u32 value, void *iomem,
> +                          unsigned long off)
> +{
> +     pr_err("%s: w reg 0x%lx(0x%p), 0x%x.\n", fn, off, iomem, value);
> +     iowrite32(value, iomem);
> +}
> +#define write_register(v, mem, off) __write_register(__func__, v, mem, off)
> +#else
> +#define write_register(v, mem, off) iowrite32(v, mem)
> +#endif
> +
> +inline u32 read_register(void *iomem)
> +{
> +     return ioread32(iomem);

Just use ioread32, no silly wrappers. Actually, I think it should be
readl/readw/readb and so on...

> +}
> +
> +static inline u32 build_u32(u32 hi, u32 lo)
> +{
> +     return ((hi & 0xFFFFUL) << 16) | (lo & 0xFFFFUL);
> +}
> +
> +static inline u64 build_u64(u64 hi, u64 lo)
> +{
> +     return ((hi & 0xFFFFFFFULL) << 32) | (lo & 0xFFFFFFFFULL);
> +}
> +
> +static void check_nonzero_interrupt_status(struct xdma_dev *xdev)
> +{
> +     struct interrupt_regs *reg =
> +             (struct interrupt_regs *)(xdev->bar[xdev->config_bar_idx] +
> +                                       XDMA_OFS_INT_CTRL);
> +     u32 w;
> +
> +     w = read_register(&reg->user_int_enable);
> +     if (w)
> +             pr_info("%s xdma%d user_int_enable = 0x%08x\n",
> +                     dev_name(&xdev->pdev->dev), xdev->idx, w);

prints on interrupts? No, this kills dmesg.

Sorry, you try to push some vendor code, instead of merging to existing
drivers and using Linux coding style. I'll skip parts here - you need to
work on it. :/

> +int xdma_kthread_stop(struct xdma_kthread *thp)
> +{
> +     int rv;
> +
> +     if (!thp->task) {
> +             pr_debug_thread("kthread %s, already stopped.\n", thp->name);
> +             return 0;
> +     }
> +
> +     thp->schedule = 1;
> +     rv = kthread_stop(thp->task);
> +     if (rv < 0) {
> +             pr_warn("kthread %s, stop err %d.\n", thp->name, rv);
> +             return rv;
> +     }
> +
> +     pr_debug_thread("kthread %s, 0x%p, stopped.\n", thp->name, thp->task);
> +     thp->task = NULL;
> +
> +     return 0;
> +}
> +
> +
> +

Code needs cleanup...

(...)

> diff --git a/drivers/dma/xilinx/xdma_thread.h b/drivers/dma/xilinx/xdma_thread.h
> new file mode 100644
> index 000000000000..508dd4c4c890
> --- /dev/null
> +++ b/drivers/dma/xilinx/xdma_thread.h
> @@ -0,0 +1,134 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This file is part of the Xilinx DMA IP Core driver for Linux
> + *
> + * Copyright (c) 2017-present,  Xilinx, Inc.

Present? There is no such year.

> + */
> +
> +#ifndef XDMA_THREAD_H
> +#define XDMA_THREAD_H
> +/**
> + * @file

Is it standard kerneldoc comment?

> + * @brief This file contains the declarations for xdma kernel threads
> + *
> + */
> +#include <linux/version.h>
> +#include <linux/spinlock.h>
> +#include <linux/kthread.h>
> +#include <linux/cpuset.h>
> +#include <linux/signal.h>
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/uaccess.h>
> +#include <linux/errno.h>
> +#include "xdma_core.h"
> +
> +#ifdef DEBUG_THREADS
> +#define lock_thread(thp)     \
> +     do { \
> +             pr_debug("locking thp %s ...\n", (thp)->name); \
> +             spin_lock(&(thp)->lock); \
> +     } while (0)
> +
> +#define unlock_thread(thp)   \
> +     do { \
> +             pr_debug("unlock thp %s ...\n", (thp)->name); \
> +             spin_unlock(&(thp)->lock); \
> +     } while (0)
> +
> +#define xdma_kthread_wakeup(thp)     \
> +     do { \
> +             pr_info("signaling thp %s ...\n", (thp)->name); \
> +             wake_up_process((thp)->task); \
> +     } while (0)
> +
> +#define pr_debug_thread(fmt, ...) pr_info(fmt, __VA_ARGS__)
> +
> +#else
> +/** lock thread macro */
> +#define lock_thread(thp)             spin_lock(&(thp)->lock)
> +/** un lock thread macro */
> +#define unlock_thread(thp)           spin_unlock(&(thp)->lock)
> +#define xdma_kthread_wakeup(thp) \
> +     do { \
> +             thp->schedule = 1; \
> +             wake_up_interruptible(&thp->waitq); \
> +     } while (0)
> +/** pr_debug_thread */
> +#define pr_debug_thread(fmt, ...)
> +#endif
> +
> +/**
> + * @struct - xdma_kthread
> + * @brief    xdma thread book keeping parameters
> + */
> +struct xdma_kthread {
> +     /**  thread lock*/

Weird comment style. Use Linux kernel coding style comments. In this
case - use proper kerneldoc.

> +     spinlock_t lock;
> +     /**  name of the thread */
> +     char name[16];
> +     /**  cpu number for which the thread associated with */
> +     unsigned short cpu;
> +     /**  thread id */
> +     unsigned short id;
> +     /**  thread sleep timeout value */
> +     unsigned int timeout;
> +     /**  flags for thread */
> +     unsigned long flag;
> +     /**  thread wait queue */
> +     wait_queue_head_t waitq;
> +     /* flag to indicate scheduling of thread */
> +     unsigned int schedule;
> +     /**  kernel task structure associated with thread*/
> +     struct task_struct *task;
> +     /**  thread work list count */
> +     unsigned int work_cnt;
> +     /**  thread work list count */
> +     struct list_head work_list;
> +     /**  thread initialization handler */
> +     int (*finit)(struct xdma_kthread *thread);
> +     /**  thread pending handler */
> +     int (*fpending)(struct list_head *list);
> +     /**  thread peocessing handler */
> +     int (*fproc)(struct list_head *list);
> +     /**  thread done handler */
> +     int (*fdone)(struct xdma_kthread *thread);
> +};
> +
> +
> +/*****************************************************************************/

Weird comment style. Use Linux kernel coding style comments.

> +/**
> + * xdma_threads_create() - create xdma threads
> + *****************************************************************************/
> +int xdma_threads_create(unsigned int num_threads);
> +
> +/*****************************************************************************/
> +/**
> + * xdma_threads_destroy() - destroy all the xdma threads created
> + *                          during system initialization
> + *
> + * @return   none
> + *****************************************************************************/
> +void xdma_threads_destroy(void);
> +
> +/*****************************************************************************/
> +/**
> + * xdma_thread_remove_work() - handler to remove the attached work thread
> + *
> + * @param[in]        engine: pointer to xdma_engine
> + *
> + * @return   none
> + *****************************************************************************/
> +void xdma_thread_remove_work(struct xdma_engine *engine);
> +
> +/*****************************************************************************/
> +/**
> + * xdma_thread_add_work() - handler to add a work thread
> + *
> + * @param[in]        engine: pointer to xdma_engine
> + *
> + * @return   none
> + *****************************************************************************/
> +void xdma_thread_add_work(struct xdma_engine *engine);
> +
> +#endif /* XDMA_THREAD_H */
> diff --git a/drivers/dma/xilinx/xdma_version.h b/drivers/dma/xilinx/xdma_version.h
> new file mode 100644
> index 000000000000..bd061b6bc513
> --- /dev/null
> +++ b/drivers/dma/xilinx/xdma_version.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This file is part of the Xilinx DMA IP Core driver for Linux
> + *
> + * Copyright (c) 2016-present,  Xilinx, Inc.

> + */
> +
> +#ifndef XDMA_VERSION_H
> +#define XDMA_VERSION_H
> +
> +#define DRV_MOD_MAJOR                2021
> +#define DRV_MOD_MINOR                4
> +#define DRV_MOD_PATCHLEVEL   1

What's that? We do not version drivers in Linux kernel. Entire header
should be removed.

> +
> +#define DRV_MODULE_VERSION      \
> +     __stringify(DRV_MOD_MAJOR) "." \
> +     __stringify(DRV_MOD_MINOR) "." \
> +     __stringify(DRV_MOD_PATCHLEVEL)
> +
> +#define DRV_MOD_VERSION_NUMBER  \
> +     ((DRV_MOD_MAJOR)*1000 + (DRV_MOD_MINOR)*100 + DRV_MOD_PATCHLEVEL)
> +
> +#endif /* XDMA_VERSION_H */
> diff --git a/include/linux/dma/xilinx_xdma.h b/include/linux/dma/xilinx_xdma.h
> new file mode 100644
> index 000000000000..4a0c3e02ec6f
> --- /dev/null
> +++ b/include/linux/dma/xilinx_xdma.h
> @@ -0,0 +1,91 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This file is part of the Xilinx DMA IP Core driver for Linux
> + *
> + * Copyright (c) 2016-present,  Xilinx, Inc.
> + * Copyright (c) 2020-present,  Digiteq Automotive s.r.o.
> + */
> +
> +#ifndef XILINX_XDMA_H
> +#define XILINX_XDMA_H
> +
> +#include <linux/types.h>
> +#include <linux/scatterlist.h>
> +#include <linux/interrupt.h>
> +
> +/*
> + * xdma_device_open - read the pci bars and configure the fpga
> + *   should be called from probe()
> + *   NOTE: user interrupt will not enabled until xdma_user_isr_enable() is called
> + *
> + * @pdev: ptr to pci_dev

Is it kerneldoc or not? If it is, make it proper kerneldoc.

> + * @mod_name: the module name to be used for request_irq
> + * @user_max: max # of user/event (interrupts) to be configured
> + * @channel_max: max # of c2h and h2c channels to be configured
> + *   NOTE: if the user/channel provisioned is less than the max specified,
> + *   libxdma will update the user_max/channel_max
> + *
> + * returns a opaque handle (for libxdma to identify the device) NULL, in case of
> + * error
> + */
> +void *xdma_device_open(const char *mod_name, struct pci_dev *pdev,
> +              int *user_max, int *h2c_channel_max, int *c2h_channel_max);
> +

Best regards,
Krzysztof

INTERNAL
