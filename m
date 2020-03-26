Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D233A194721
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 20:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728640AbgCZTIh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 15:08:37 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52170 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgCZTIh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 15:08:37 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 293262979D9
Message-ID: <03f7e88c778f7234ff53579527c4481367fe645c.camel@collabora.com>
Subject: Re: [PATCH v3 7/7] dt-bindings: rockchip-vpu: Convert bindings to
 json-schema
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Date:   Thu, 26 Mar 2020 16:08:23 -0300
In-Reply-To: <20200326165511.GA11084@bogus>
References: <20200325213439.16509-1-ezequiel@collabora.com>
         <20200325213439.16509-8-ezequiel@collabora.com>
         <20200326165511.GA11084@bogus>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-03-26 at 10:55 -0600, Rob Herring wrote:
> On Wed, 25 Mar 2020 18:34:38 -0300, Ezequiel Garcia wrote:
> > Convert Rockchip VPU (Hantro IP block) codec driver documentation to
> > json-schema.
> > 
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  .../bindings/media/rockchip-vpu.txt           | 43 ----------
> >  .../bindings/media/rockchip-vpu.yaml          | 82 +++++++++++++++++++
> >  MAINTAINERS                                   |  2 +-
> >  3 files changed, 83 insertions(+), 44 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/rockchip-vpu.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Error: Documentation/devicetree/bindings/media/rockchip-vpu.example.dts:28.41-42 syntax error
> FATAL ERROR: Unable to parse input tree
> scripts/Makefile.lib:311: recipe for target 'Documentation/devicetree/bindings/media/rockchip-vpu.example.dt.yaml' failed
> make[1]: *** [Documentation/devicetree/bindings/media/rockchip-vpu.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> Makefile:1262: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
> 
> See https://patchwork.ozlabs.org/patch/1261669
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
> 

Sure, I will.

Sorry about that!

Ezequiel

