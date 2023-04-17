Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 527266E49AC
	for <lists+linux-media@lfdr.de>; Mon, 17 Apr 2023 15:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjDQNRH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Apr 2023 09:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbjDQNQf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Apr 2023 09:16:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F9646A8
        for <linux-media@vger.kernel.org>; Mon, 17 Apr 2023 06:16:11 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1poOi2-0004iF-Dt; Mon, 17 Apr 2023 15:15:54 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1poOi1-0004G6-BX; Mon, 17 Apr 2023 15:15:53 +0200
Date:   Mon, 17 Apr 2023 15:15:53 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Adam Ford <aford173@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Shawn Guo <shawnguo@kernel.org>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: imx8mp: Add CSIS DT nodes
Message-ID: <20230417131553.bw5kkrpbptdnf6mi@pengutronix.de>
References: <20230417055627.16482-1-laurent.pinchart@ideasonboard.com>
 <20230417080117.jiqpynebq2we2hh4@pengutronix.de>
 <20230417081510.GA19964@pendragon.ideasonboard.com>
 <3232774.44csPzL39Z@steina-w>
 <CAHCN7xJ26TMD4U_5wTtGcGFHZBTTewVRd+mnKa5Ff5cRxBdHPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xJ26TMD4U_5wTtGcGFHZBTTewVRd+mnKa5Ff5cRxBdHPA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23-04-17, Adam Ford wrote:

...

> > > > > > If we would add:
> > > > > >                                                 mipi_csi_0_in:
> > endpoint {};
> > > > > >
> > > > > > here we could refernce it from overlays/board dts files more easily.
> > > > >
> > > > > Isn't there an unwritten rule (or consensus) that an endpoint should
> > > > > always have a remote-endpoint property ?
> > > >
> > > > I don't know if there is one.
> > > >
> > > > > While ports describe hardware properties of a device and should always
> > > > > be there regardless of connections, endpoints describe connections and
> > > > > I don't think they should be instantiated with a valid
> > > > > remote-endpoint.
> > > >
> > > > I know, therefore I mentioned it as idea to make it 'easier' to add
> > > > camera nodes.
> > >
> > > As a middleground, would it be useful to have a label for the port ?
> > > Something like
> > >
> > >       mipi_csi_0: csi@32e40000 {
> > >               ports {
> > >                       mipi_csi_0_port_0: port@0 {
> > >                       };
> > >               };
> > >       };
> > >
> > > An overlay could then reference that and create the endpoint. I'm not
> > > entirely sure how useful that would be though, as the overlay would need
> > > to enable the CSI node anyway. Compare
> > >
> > > --------
> > > &mipi_csi_0 {
> > >       status = "okay";
> > > };
> > >
> > > &mipi_csi_0_port_0 {
> > >       mipi_csi_0_in: endpoint {
> > >               remote-endpoint = <&imx327_out>;
> > >       };
> > > };
> > > --------
> > >
> > > with
> > >
> > > --------
> > > &mipi_csi_0 {
> > >       status = "okay";
> > >
> > >       ports {
> > >               port@0 {
> > >                       mipi_csi_0_in: endpoint {
> > >                               remote-endpoint = <&imx327_out>;
> > >                       };
> > >               };
> > >       };
> > > };
> > > --------
> > >
> > > I have a slight preference for the latter as it groups all the CSI0 data
> > > in a single overlay target, but if the former is generally preferred,
> > > I'm fine with that too.
> >
> > The former is more compact, but also raises the following dtc warnings while
> > creating the .dtbo:
> > Warning (graph_endpoint): /fragment@4/__overlay__: graph endpoint node name
> > should be 'endpoint'
> > Warning (graph_endpoint): /fragment@4/__overlay__: graph connection to node '/
> > fragment@1/__overlay__/ports/port@1/endpoint' is not bidirectional
> >
> > for the following snippet:
> >
> > &mipi_csi_0_out {
> >         remote-endpoint = <&isp1_in>;
> > };
> >
> > I'm not sure if there is a chance to fix at all.
> 
> Once there is consensus on how this should be generically plumbed,
> please keep me in the loop, so I can add the corresponding imx8m Nano
> trees as well.  I've tested Laurent's work for a while on the Nano
> that I have.  I was going to push DT updates for Nano, then I saw this
> conversation, so I decided to hold off for now.

This was just an idea nothing serious. Maybe Krzysztof have a strong
opinion on that.

Regards,
  Marco
