Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69B99286076
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 15:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728498AbgJGNw1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 09:52:27 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34752 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgJGNw1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 09:52:27 -0400
Received: by mail-ot1-f68.google.com with SMTP id d28so2292210ote.1;
        Wed, 07 Oct 2020 06:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gA7DS7kOecIZ6RJAOmqIqCf/U4XbVhrJ3QCudoJwBgE=;
        b=e069FapJY8qnyMYEqtkMYC2NuoTKSAlFKH79elSlqVyIxhMWnMeXeNaGB34lVPLV6T
         nO1kvpbL+4+fdVb2FvFLCN0fDfAeeun9zSGzzwr5TJlfhlYQOaW7HSU82Np42I7Etn1J
         SGlxOSLsUWbC1bT/1F/Ax0CWjRE0lVwVrrlDhpA9R8ixih7zhLncv/hEtt+UVoTTs2DC
         rQfQn6Yp0DCOz0xbi6zegDisdxZGQkIdraPrtW91sGxEkVSHdxH+i87eMdmxefkOG+PQ
         VX1szcGGP08Y8MThwkUaagwNLbB2Tzf4S5kITwMBs7j+FMyYySbumFMJ48rX399lkLql
         IvZQ==
X-Gm-Message-State: AOAM533V7WomGWLZluvsMtQJmU5qN2VUlyLZZRqyX9JgXLe5T4BDty1d
        2UZuRq9WCi2/RWlNVss80U3sO3weWbPB
X-Google-Smtp-Source: ABdhPJzhwrPz1f45PvWAazbi0bvs8lyFSAWAvbQSYXlKPUjkg6gW44SwmWhyYF/b1CpX/o3Aq+gwkw==
X-Received: by 2002:a9d:6649:: with SMTP id q9mr1981441otm.286.1602078746535;
        Wed, 07 Oct 2020 06:52:26 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l25sm1750472otb.4.2020.10.07.06.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 06:52:25 -0700 (PDT)
Received: (nullmailer pid 126506 invoked by uid 1000);
        Wed, 07 Oct 2020 13:52:25 -0000
Date:   Wed, 7 Oct 2020 08:52:25 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 026/106] dt-bindings: mipi-ccs: Add bus-type for C-PHY
 support
Message-ID: <20201007135225.GA125839@bogus>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084505.25761-8-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007084505.25761-8-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 07 Oct 2020 11:45:03 +0300, Sakari Ailus wrote:
> The bus-type property is required for C-PHY support. Add it, including
> values for CCP2 and CSI-2 D-PHY.
> 
> Also require the bus-type property. Effectively all new sensors are MIPI
> D-PHY or C-PHY that cannot be told apart without the bus-type property.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../devicetree/bindings/media/i2c/mipi-ccs.yaml          | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 


My bot found errors running 'make dt_binding_check' on your patch:

Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 852, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning a plain scalar
  in "<unicode string>", line 89, column 13
found a tab character that violates indentation
  in "<unicode string>", line 90, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:18: Documentation/devicetree/bindings/media/i2c/mipi-ccs.example.dts] Error 1
make[1]: *** Deleting file 'Documentation/devicetree/bindings/media/i2c/mipi-ccs.example.dts'
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml:  while scanning a plain scalar
  in "<unicode string>", line 89, column 13
found a tab character that violates indentation
  in "<unicode string>", line 90, column 1
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1377845

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

