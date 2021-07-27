Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85D133D7D5B
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 20:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhG0S0l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 14:26:41 -0400
Received: from mail-il1-f182.google.com ([209.85.166.182]:44756 "EHLO
        mail-il1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbhG0S0k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 14:26:40 -0400
Received: by mail-il1-f182.google.com with SMTP id o7so162911ilh.11;
        Tue, 27 Jul 2021 11:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=3DEZXygmMlbze51t61j0f6IluPe9JhL1JPPs4o0+k/c=;
        b=JUhzvjk4VfvedQWDbz86cKmdII61TH7wO6Qy/WMmvd6haqYLlzhpeaXbLiCika6MhH
         WdvvalGiFp7Y7gKKMygJ9qTasdtPmYCzna66aBvOL3ZmjDGJ9ssgtTgnx3l8Wtm8NyWN
         k+5wVcvWj/6FXK0Cu9UWoq1hVUogeOwNzhAkXQE84MBUJTvTiaNdcGAyCbKzvcYxbexj
         hesIJ+7kce+rpCnk7i1q2UzeDbk8diPMeB0VDirQBUr0QqFTMs3ybGzlpKq5c0jG7p/E
         5+X7eeLwJ3YFww0cCcoadiMLegVEouDFX1tafgnZlPkOOKL+ePY5T6+28ko8/uDMkpNc
         fOGw==
X-Gm-Message-State: AOAM533/iVgLDzhrHbhgUQ9Fs+MOJUEkdpdotMGnIF3NJg4o4fj4Ly46
        cVNraidb5M3UbwiAA0XD6A==
X-Google-Smtp-Source: ABdhPJwfRr8AvkY38MhYpDZWVP8j2iQzXoN0b+J+lJpwI2+Gqkmx9sagb5uvIKdLN+TXbdBGUM5t2Q==
X-Received: by 2002:a92:7d08:: with SMTP id y8mr17500252ilc.111.1627410399986;
        Tue, 27 Jul 2021 11:26:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id i11sm2301722ilb.15.2021.07.27.11.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 11:26:39 -0700 (PDT)
Received: (nullmailer pid 3210651 invoked by uid 1000);
        Tue, 27 Jul 2021 18:26:35 -0000
From:   Rob Herring <robh@kernel.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     linux-kernel@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        linux-media@vger.kernel.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@google.com>,
        Irui Wang <irui.wang@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com
In-Reply-To: <20210727101051.24418-14-yunfei.dong@mediatek.com>
References: <20210727101051.24418-1-yunfei.dong@mediatek.com> <20210727101051.24418-14-yunfei.dong@mediatek.com>
Subject: Re: [PATCH v3, 13/15] dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
Date:   Tue, 27 Jul 2021 12:26:35 -0600
Message-Id: <1627410395.860934.3210650.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 27 Jul 2021 18:10:49 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8192.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v3: Fix yaml check fail.
> ---
>  .../media/mediatek,vcodec-comp-decoder.yaml   | 154 ++++++++++++++++++
>  1 file changed, 154 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 122, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 132, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 722, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 446, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 264, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 295, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 19, column 5
found duplicate key "items" with value "[]" (original value: "[]")
  in "<unicode string>", line 21, column 5

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys

Duplicate keys will become an error in future releases, and are errors
by default when using the new API.

make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 67, in <module>
    ret = check_doc(f)
  File "/usr/local/bin/dt-doc-validate", line 25, in check_doc
    testtree = dtschema.load(filename, line_number=line_number)
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 623, in load
    return yaml.load(f.read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 122, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 132, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 722, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 446, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 264, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 295, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 19, column 5
found duplicate key "items" with value "[]" (original value: "[]")
  in "<unicode string>", line 21, column 5

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys

Duplicate keys will become an error in future releases, and are errors
by default when using the new API.

make[1]: *** Deleting file 'Documentation/devicetree/bindings/processed-schema-examples.json'
Traceback (most recent call last):
  File "/usr/local/bin/dt-mk-schema", line 38, in <module>
    schemas = dtschema.process_schemas(args.schemas, core_schema=(not args.useronly))
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 585, in process_schemas
    sch = process_schema(os.path.abspath(filename))
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 558, in process_schema
    schema = load_schema(filename)
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 125, in load_schema
    return do_load(os.path.join(schema_basedir, schema))
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 111, in do_load
    return yaml.load(f.read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 122, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 132, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 722, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 446, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 264, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 295, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 19, column 5
found duplicate key "items" with value "[]" (original value: "[]")
  in "<unicode string>", line 21, column 5

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys

Duplicate keys will become an error in future releases, and are errors
by default when using the new API.

make[1]: *** [Documentation/devicetree/bindings/Makefile:62: Documentation/devicetree/bindings/processed-schema-examples.json] Error 1
make: *** [Makefile:1418: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1510417

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

