Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C49D03F19BA
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 14:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239503AbhHSMt7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 08:49:59 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:41967 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237758AbhHSMtr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 08:49:47 -0400
Received: by mail-ot1-f41.google.com with SMTP id w22-20020a056830411600b0048bcf4c6bd9so8544071ott.8;
        Thu, 19 Aug 2021 05:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=ZNMlpd5elTsi6B8hZyA4f6ldMNMZe0l4iu+9KL9MAls=;
        b=AkocnMOb3viSGj0rGYhfDN1q4YN824IhHFgMhCwAl/wpPUrpwIviH4C70LP66Kru6W
         51UExmKs71WBf5tF0wH7Y8pi4yRHV+zosMFzZ0Haf2iWr2qMwlGT4jBczejQmjN1XSJ3
         GlI7zenoDkpRCrheKzdpDhAsEf2W6DN+6LVySO9beTad/NnwKIdN9PvhtOQ4mfQ1OZRQ
         ZCXcia2sO8wfolDM9ft323E5n1pVbvkt/gEWJMVOKJ9vr+6LKJJQzGFY3u5+x/aNB/0n
         HdtvwBXwbbV+gDfKpyhzWQVJu3YPI7PBu+Qv6H56OdPXiC07kPv5D3cPfphnEcTGZTtP
         ynjQ==
X-Gm-Message-State: AOAM5317SXp9/c0L/n9MoL5Z3kqttBmtdzrY4SjvUFR7HQeUHTqGr+8p
        P9kwDILx0Zxvw9ePsZ41xUlo6Lkgag==
X-Google-Smtp-Source: ABdhPJx3jDL4kYXzHNo10aYXPmecs8RlS3lgGSDuZYyaYvNJSUU0W1uDlCeC1BzxHjCr+IqeAl5AoA==
X-Received: by 2002:a05:6830:12c1:: with SMTP id a1mr12254350otq.231.1629377351101;
        Thu, 19 Aug 2021 05:49:11 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n4sm555536ooe.10.2021.08.19.05.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 05:49:10 -0700 (PDT)
Received: (nullmailer pid 288208 invoked by uid 1000);
        Thu, 19 Aug 2021 12:49:09 -0000
From:   Rob Herring <robh@kernel.org>
To:     Moudy Ho <moudy.ho@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>, acourbot@chromium.org,
        pihsun@chromium.org, daoyuan huang <daoyuan.huang@mediatek.com>,
        Rob Landley <rob@landley.net>, drinkcat@chromium.org,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        sj.huang@mediatek.com, menghui.lin@mediatek.com,
        tfiga@chromium.org, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        hsinyi@google.com, Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        randy.wu@mediatek.com, srv_heupstream@mediatek.com,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-mediatek@lists.infradead.org, ben.lok@mediatek.com,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
In-Reply-To: <20210819070954.16679-4-moudy.ho@mediatek.com>
References: <20210819070954.16679-1-moudy.ho@mediatek.com> <20210819070954.16679-4-moudy.ho@mediatek.com>
Subject: Re: [PATCH v6 3/5] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
Date:   Thu, 19 Aug 2021 07:49:09 -0500
Message-Id: <1629377349.142826.288207.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 19 Aug 2021 15:09:52 +0800, Moudy Ho wrote:
> This patch adds DT binding document for Media Data Path 3 (MDP3)
> a unit in multimedia system used for scaling and color format convert.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-ccorr.yaml   |  58 +++++
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 241 ++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-rsz.yaml     |  66 +++++
>  .../bindings/media/mediatek,mdp3-wdma.yaml    |  71 ++++++
>  .../bindings/media/mediatek,mdp3-wrot.yaml    |  71 ++++++
>  5 files changed, 507 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 120, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 848, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning a block scalar
  in "<unicode string>", line 171, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 183, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml:  while scanning a block scalar
  in "<unicode string>", line 171, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 183, column 1
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
make: *** [Makefile:1419: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1518477

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

