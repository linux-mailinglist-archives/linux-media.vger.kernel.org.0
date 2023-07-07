Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 043F074BA3B
	for <lists+linux-media@lfdr.de>; Sat,  8 Jul 2023 01:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbjGGXzt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jul 2023 19:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjGGXzs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jul 2023 19:55:48 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D6122114
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 16:55:47 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b6f97c7115so37682841fa.2
        for <linux-media@vger.kernel.org>; Fri, 07 Jul 2023 16:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20221208.gappssmtp.com; s=20221208; t=1688774146; x=1691366146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dso2mcatmgfyOH+exjp6YHYefmmJPBr+6wmnSbURNss=;
        b=Gla6d4HsaUjJy9WjX1asNY6ZNEdzeEWUwC0Besvq0JkMFcDjgth5Nsz1mFPyH2XE5V
         gErvv3N/cEctuEZoWhwXOHMEKCR9vFo/UASGbTEZu4qwCOB79pbnXX88Hb0MhGsseomc
         HhEBddFopoX97m+/9Jgj/kxlZy4KdPiDQyAvsMTdob5f4G/SYFRI36+ijRyNFvL5RnvX
         +mcoeQIsgWAxZEXHhxnW8JWPd5J/3RJ81jccaAauh9JLV7AmZeIy7qMQzGkwXz4PuvD+
         zYPg6fVALpmo18QvRcwGMVVU5FUHaOvWSopO84D2ghKJyMVay9VTj05xUjdi3OgxxTvZ
         coNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688774146; x=1691366146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dso2mcatmgfyOH+exjp6YHYefmmJPBr+6wmnSbURNss=;
        b=ImHwT4NMeF9RmpQGQVBEou5/rOWDVhLeefCXXnnnZgLf4jIphYBWoZahXQAT7LU4AA
         +dVNKPTRtDwGzpCHD8SxhIL0AyW1eZa/iKgqJ3JcA35HWS7tF8OW3jMO5UIfbQi+42ja
         J6FowdU5XmBbkXy0nefF9vHFH7Ea8HVqZ0DNC32b3SWFuSYIY7/L/+H3NvwSHsJ7kWXT
         4DSkOE2+SWH9qq6FstrRELG4RYWW/Ngw9l3iRLRcjH09mrf1YYRFX3lewBrfs8JAo3c6
         7a1fK16STGw6oKhqU1gYTt92UEC8MZmLjUiezQ5MQw2MqaumibgkyvmSCJINVtbyoi9X
         r9qA==
X-Gm-Message-State: ABy/qLa9nz83/h0S9Fhsa2Em/hHlr2XIiFeRQc058F7ex2sg1MvxbWJX
        CS6iQe3zk1Jf1+Nf4Yde7mI/Y7qxtKYYIkN1GZunIA==
X-Google-Smtp-Source: APBJJlFvAEM84y0BrkAjkxEDlbGpQ9eHri+HEwLLbNnPPKMCG6FZAVzbcMXgOKyPIXnwhr2elBDRxLbN0dCGbUGaDcU=
X-Received: by 2002:a2e:b163:0:b0:2b6:df6b:84c0 with SMTP id
 a3-20020a2eb163000000b002b6df6b84c0mr4716545ljm.25.1688774145636; Fri, 07 Jul
 2023 16:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230417055627.16482-1-laurent.pinchart@ideasonboard.com>
 <20230417080117.jiqpynebq2we2hh4@pengutronix.de> <20230417081510.GA19964@pendragon.ideasonboard.com>
 <3232774.44csPzL39Z@steina-w> <CAHCN7xJ26TMD4U_5wTtGcGFHZBTTewVRd+mnKa5Ff5cRxBdHPA@mail.gmail.com>
 <20230417131553.bw5kkrpbptdnf6mi@pengutronix.de>
In-Reply-To: <20230417131553.bw5kkrpbptdnf6mi@pengutronix.de>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 7 Jul 2023 16:55:33 -0700
Message-ID: <CAJ+vNU2itUCBBagcHW+LhoLdhOvJQ=QKup8LZJuQu6HD2M6dvg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: imx8mp: Add CSIS DT nodes
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Shawn Guo <shawnguo@kernel.org>, linux-media@vger.kernel.org,
        Marco Felsch <m.felsch@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 17, 2023 at 6:16=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> On 23-04-17, Adam Ford wrote:
>
> ...
>
> > > > > > > If we would add:
> > > > > > >                                                 mipi_csi_0_in=
:
> > > endpoint {};
> > > > > > >
> > > > > > > here we could refernce it from overlays/board dts files more =
easily.
> > > > > >
> > > > > > Isn't there an unwritten rule (or consensus) that an endpoint s=
hould
> > > > > > always have a remote-endpoint property ?
> > > > >
> > > > > I don't know if there is one.
> > > > >
> > > > > > While ports describe hardware properties of a device and should=
 always
> > > > > > be there regardless of connections, endpoints describe connecti=
ons and
> > > > > > I don't think they should be instantiated with a valid
> > > > > > remote-endpoint.
> > > > >
> > > > > I know, therefore I mentioned it as idea to make it 'easier' to a=
dd
> > > > > camera nodes.
> > > >
> > > > As a middleground, would it be useful to have a label for the port =
?
> > > > Something like
> > > >
> > > >       mipi_csi_0: csi@32e40000 {
> > > >               ports {
> > > >                       mipi_csi_0_port_0: port@0 {
> > > >                       };
> > > >               };
> > > >       };
> > > >
> > > > An overlay could then reference that and create the endpoint. I'm n=
ot
> > > > entirely sure how useful that would be though, as the overlay would=
 need
> > > > to enable the CSI node anyway. Compare
> > > >
> > > > --------
> > > > &mipi_csi_0 {
> > > >       status =3D "okay";
> > > > };
> > > >
> > > > &mipi_csi_0_port_0 {
> > > >       mipi_csi_0_in: endpoint {
> > > >               remote-endpoint =3D <&imx327_out>;
> > > >       };
> > > > };
> > > > --------
> > > >
> > > > with
> > > >
> > > > --------
> > > > &mipi_csi_0 {
> > > >       status =3D "okay";
> > > >
> > > >       ports {
> > > >               port@0 {
> > > >                       mipi_csi_0_in: endpoint {
> > > >                               remote-endpoint =3D <&imx327_out>;
> > > >                       };
> > > >               };
> > > >       };
> > > > };
> > > > --------
> > > >
> > > > I have a slight preference for the latter as it groups all the CSI0=
 data
> > > > in a single overlay target, but if the former is generally preferre=
d,
> > > > I'm fine with that too.
> > >
> > > The former is more compact, but also raises the following dtc warning=
s while
> > > creating the .dtbo:
> > > Warning (graph_endpoint): /fragment@4/__overlay__: graph endpoint nod=
e name
> > > should be 'endpoint'
> > > Warning (graph_endpoint): /fragment@4/__overlay__: graph connection t=
o node '/
> > > fragment@1/__overlay__/ports/port@1/endpoint' is not bidirectional
> > >
> > > for the following snippet:
> > >
> > > &mipi_csi_0_out {
> > >         remote-endpoint =3D <&isp1_in>;
> > > };
> > >
> > > I'm not sure if there is a chance to fix at all.
> >
> > Once there is consensus on how this should be generically plumbed,
> > please keep me in the loop, so I can add the corresponding imx8m Nano
> > trees as well.  I've tested Laurent's work for a while on the Nano
> > that I have.  I was going to push DT updates for Nano, then I saw this
> > conversation, so I decided to hold off for now.
>
> This was just an idea nothing serious. Maybe Krzysztof have a strong
> opinion on that.
>
> Regards,
>   Marco
>

Hi Laurent,

Is there any consensus on this yet?

I have a imx219 camera attached to an imx8mp-venice-gw74xx that I'm
trying to figure out how to connect up via an overlay to test it.

Best regards,

Tim
