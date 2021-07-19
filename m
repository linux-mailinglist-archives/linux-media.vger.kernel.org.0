Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C97B43CD60D
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 15:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240579AbhGSNHM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 09:07:12 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:41905 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240562AbhGSNHG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 09:07:06 -0400
Received: by mail-io1-f43.google.com with SMTP id z9so19938642iob.8;
        Mon, 19 Jul 2021 06:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=WFCd6dwHjP9c0OpScI2NVJFExqK4DR+8Hm3FZ0Ju4A8=;
        b=OFz5X5eho3UOOlxYjvbVoE12/n7qDAWubTcOcPElDiMmQr1uXzll9Gv+d3B5ow8wqz
         qCt6t5nbZj9sO0Es7OX8JM1k4GYEn+teCcqkOuzONi+g1NNTccqrxKPO40bDZqXgf9KW
         ODu+M1CQRqL1o3QWqkTO6CGNwlH1CIDlKWLfgnxEA0Az5w+YrQqJNBHhZvcl3sMjLIfY
         eYWx+fA3A+oWzj3Rj9cRtxDji2TjFE8kwhBs4pbEjrYp5Lw4cFZ+R/OCNhe2sv+zfGCn
         Fq5fXTGf2hsVPhbgCzrWQlh21DZN82Kh1LD20BC0c7ro2Sn00FHqAkPoFpmz6OpVlDx1
         JlZQ==
X-Gm-Message-State: AOAM531EveUhdks7OdX/uG1Nm3IPwo10I2L1FiUDrwhtIbfMerIdo0dh
        lCoB3IlbXu5Ye+J36d9rQw==
X-Google-Smtp-Source: ABdhPJxkUhkTuVO75TKOfepgSVLaTuhyX3sK4tEcS2rWzTjiIE6gnHDCd9SJs8Xqf9VmYtXYYijRSg==
X-Received: by 2002:a05:6638:192:: with SMTP id a18mr21909828jaq.47.1626702465656;
        Mon, 19 Jul 2021 06:47:45 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id e17sm9368630ilr.51.2021.07.19.06.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 06:47:45 -0700 (PDT)
Received: (nullmailer pid 1811202 invoked by uid 1000);
        Mon, 19 Jul 2021 13:47:28 -0000
From:   Rob Herring <robh@kernel.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        devicetree@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@google.com>, linux-media@vger.kernel.org,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        srv_heupstream@mediatek.com,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        linux-mediatek@lists.infradead.org,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        linux-kernel@vger.kernel.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Irui Wang <irui.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
In-Reply-To: <20210717081233.7809-13-yunfei.dong@mediatek.com>
References: <20210717081233.7809-1-yunfei.dong@mediatek.com> <20210717081233.7809-13-yunfei.dong@mediatek.com>
Subject: Re: [PATCH v2, 12/14] dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
Date:   Mon, 19 Jul 2021 07:47:28 -0600
Message-Id: <1626702448.426819.1811201.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 17 Jul 2021 16:12:31 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8192.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v2: using yaml format to instead of txt file.
> ---
>  .../media/mediatek-vcodec-comp-decoder.yaml   | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.example.dts'
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
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 850, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 891, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: mapping values are not allowed in this context
  in "<unicode string>", line 20, column 18
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.yaml:  mapping values are not allowed in this context
  in "<unicode string>", line 20, column 18
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.yaml
make: *** [Makefile:1418: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1506388

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

