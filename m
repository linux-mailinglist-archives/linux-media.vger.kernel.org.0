Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B54755B0427
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 14:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbiIGMq0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 08:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiIGMqZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 08:46:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89AD2B99DF
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 05:46:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3515BDD;
        Wed,  7 Sep 2022 14:46:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662554782;
        bh=M9UrF97d8ZldjoDi18M7vJR8eCA2EaIOz1oLSviPIjA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TY1FSQCi9ts7GMQ+Y/w0CQKSzFOXoc6JfmbuPOdVfUQkoA0drsCNz4rDuPoKV3ygs
         1rnzO8DViRiuqHFzBA1GaKPIsdO0KBZK6DJVgOilHNE9IFlzjYl+dIjAs82xEpSBm4
         f4HfI/onFLk5qfAfl5GMQQV9sXZOKI6St9NRhb3A=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
References: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl> <YxX8dzSsquJmO5hP@paasikivi.fi.intel.com> <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
Subject: Re: [ANN] Media Summit at ELCE Dublin, September 12: Draft Agenda V2
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Wed, 07 Sep 2022 13:46:19 +0100
Message-ID: <166255477952.2677993.18296326616035616015@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Laurent Pinchart (2022-09-05 15:44:26)
> On Mon, Sep 05, 2022 at 01:41:11PM +0000, Sakari Ailus wrote:
> > I think it'd be great to have a GPG key signing party at the end of the
> > meeting.
>=20
> It's a good idea. Could everybody please send their GPG key fingerprint
> in an e-mail reply to prepare for that ? It can easily be retrieved with
> 'gpg -K' (make sure to pick the right key if you have multiple of them).

sec   rsa4096 2015-09-25 [SC] [expires: 2024-09-01]
      902DD7983FBD28FDE372D47AA11E467210A461FD
uid           [ultimate] Kieran Bingham <kieran.bingham@ideasonboard.com>
uid           [ultimate] Kieran Bingham (Work Encryption Key) <kieran@linux=
embedded.co.uk>
uid           [ultimate] Kieran Bingham (Alias) <kieran@linuxembedded.uk>
uid           [ultimate] Kieran Bingham <kbingham@kernel.org>

--
Kieran
