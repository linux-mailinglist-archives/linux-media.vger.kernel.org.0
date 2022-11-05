Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0995F61D92E
	for <lists+linux-media@lfdr.de>; Sat,  5 Nov 2022 10:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiKEJno (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Nov 2022 05:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiKEJnm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Nov 2022 05:43:42 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA8EB17AB8
        for <linux-media@vger.kernel.org>; Sat,  5 Nov 2022 02:43:35 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A12AE100065; Sat,  5 Nov 2022 09:43:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1667641410; bh=VqTmLZqGyBqnsaHzMBHBWOMBkOo8jZVNzwDIpwaxoBk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WjH/8J303JteSlSuWRb5tfoAGRUCPNrZmZCPjDCkTIEsYswlapVaog7t3+b38nJV8
         EamwSBieMKpx/PVoFFiiDBo/BQiZu5Hlp9DUdG90Kx04uZusPd5kaZWMOwl5sKKw5y
         +NLzA20VMsKYOQEvxkBRE5FKzmfhnBg6rXe3x2mm8dQxFxqIxtIxbh83r9jjDBLVKN
         2dXNNgrU1ppgYhHFjaDfRPbpd7yoOLwYA1SL5MTlnSm1DDPIMA6eqtd00sp2XQT3Rz
         9ybYLMD8k4LCj+9kcxeojW8q/NsNiCqze53GBeGwtW2xMe+yhiZfBzRKy13TQg3Baz
         vg1URomN8EieQ==
Date:   Sat, 5 Nov 2022 09:43:30 +0000
From:   Sean Young <sean@mess.org>
To:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] keytable: Convert deprecated libbpf API
Message-ID: <Y2YwQpnxmvB+CXAS@gofer.mess.org>
References: <20221101202528.27306-1-sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101202528.27306-1-sudipm.mukherjee@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 01, 2022 at 08:25:28PM +0000, Sudip Mukherjee wrote:
> The libbpf APIs bpf_load_program_xattr(), bpf_create_map_node() and
> bpf_create_map_in_map_node() have been deprecated since v0.7. Convert
> them to use bpf_prog_load() and bpf_map_create().
> Also, modify config script to add a check for libbpf version.

Very nice, good to see this updated. Thank you very much.

Merged.

Sean

> 
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> ---
>  configure.ac              |  2 +-
>  utils/keytable/bpf_load.c | 59 ++++++++++++++++++++++-----------------
>  2 files changed, 34 insertions(+), 27 deletions(-)
> 
> diff --git a/configure.ac b/configure.ac
> index 05298981..9b7c371d 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -564,7 +564,7 @@ AM_CONDITIONAL([WITH_V4L2_CTL_32], [test x${enable_v4l2_ctl_32} = xyes])
>  AM_CONDITIONAL([WITH_V4L2_COMPLIANCE], [test x$ac_cv_func_fork = xyes])
>  AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_LIBV4L], [test x$ac_cv_func_fork = xyes -a x${enable_v4l2_compliance_libv4l} != xno])
>  AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_32], [test x$ac_cv_func_fork = xyes -a x${enable_v4l2_compliance_32} = xyes])
> -PKG_CHECK_MODULES([LIBBPF], [libbpf], [bpf_pc=yes], [bpf_pc=no])
> +PKG_CHECK_MODULES([LIBBPF], [libbpf >= 0.7], [bpf_pc=yes], [bpf_pc=no])
>  AM_CONDITIONAL([WITH_BPF],          [test x$enable_bpf != xno -a x$libelf_pkgconfig = xyes -a x$CLANG = xclang -a x$bpf_pc = xyes])
>  
>  # append -static to libtool compile and link command to enforce static libs
> diff --git a/utils/keytable/bpf_load.c b/utils/keytable/bpf_load.c
> index 7c633dac..06098fc3 100644
> --- a/utils/keytable/bpf_load.c
> +++ b/utils/keytable/bpf_load.c
> @@ -63,19 +63,17 @@ struct bpf_file {
>  
>  static int load_and_attach(int lirc_fd, struct bpf_file *bpf_file, struct bpf_insn *prog, int size)
>  {
> -	struct bpf_load_program_attr load_attr;
> -	int fd, err;
> +	LIBBPF_OPTS(bpf_prog_load_opts, opts);
> +	int fd, err, insn_cnt;
>  
> -	memset(&load_attr, 0, sizeof(struct bpf_load_program_attr));
> +	insn_cnt = size / sizeof(struct bpf_insn);
>  
> -	load_attr.prog_type = BPF_PROG_TYPE_LIRC_MODE2;
> -	load_attr.expected_attach_type = BPF_LIRC_MODE2;
> -	load_attr.name = bpf_file->name;
> -	load_attr.insns = prog;
> -	load_attr.insns_cnt = size / sizeof(struct bpf_insn);
> -	load_attr.license = bpf_file->license;
> +	opts.expected_attach_type = BPF_LIRC_MODE2;
> +	opts.log_buf = bpf_log_buf;
> +	opts.log_size = LOG_BUF_SIZE;
>  
> -	fd = bpf_load_program_xattr(&load_attr, bpf_log_buf, LOG_BUF_SIZE);
> +	fd = bpf_prog_load(BPF_PROG_TYPE_LIRC_MODE2, bpf_file->name,
> +				bpf_file->license, prog, insn_cnt, &opts);
>  	if (fd < 0) {
>  		printf("bpf_load_program() err=%m\n%s", bpf_log_buf);
>  		return -1;
> @@ -95,6 +93,9 @@ static int build_raw_map(struct bpf_map_data *map, struct raw_entry *raw, int nu
>  	int no_patterns, value_size, fd, key, i;
>  	struct raw_entry *e;
>  	struct raw_pattern *p;
> +	LIBBPF_OPTS(bpf_map_create_opts, opts,
> +		.map_flags = map->def.map_flags,
> +	);
>  
>  	no_patterns = 0;
>  
> @@ -110,14 +111,13 @@ static int build_raw_map(struct bpf_map_data *map, struct raw_entry *raw, int nu
>  
>  	value_size = sizeof(struct raw_pattern) + max_length * sizeof(short);
>  
> -	fd = bpf_create_map_node(map->def.type,
> -				 map->name,
> -				 map->def.key_size,
> -				 value_size,
> -				 no_patterns,
> -				 map->def.map_flags,
> -				 numa_node);
> -
> +	opts.numa_node = numa_node;
> +	fd = bpf_map_create(map->def.type,
> +			    map->name,
> +			    map->def.key_size,
> +			    value_size,
> +			    no_patterns,
> +			    &opts);
>  	if (fd < 0) {
>  		printf(_("failed to create a map: %d %s\n"),
>  		       errno, strerror(errno));
> @@ -174,27 +174,34 @@ static int load_maps(struct bpf_file *bpf_file, struct raw_entry *raw)
>  
>  		if (maps[i].def.type == BPF_MAP_TYPE_ARRAY_OF_MAPS ||
>  		    maps[i].def.type == BPF_MAP_TYPE_HASH_OF_MAPS) {
> -			int inner_map_fd = bpf_file->map_fd[maps[i].def.inner_map_idx];
> +			LIBBPF_OPTS(bpf_map_create_opts, opts,
> +				.inner_map_fd = bpf_file->map_fd[maps[i].def.inner_map_idx],
> +				.map_flags = maps[i].def.map_flags,
> +				.numa_node = numa_node,
> +			);
>  
> -			bpf_file->map_fd[i] = bpf_create_map_in_map_node(
> +			bpf_file->map_fd[i] = bpf_map_create(
>  							maps[i].def.type,
>  							maps[i].name,
>  							maps[i].def.key_size,
> -							inner_map_fd,
> +							4,
>  							maps[i].def.max_entries,
> -							maps[i].def.map_flags,
> -							numa_node);
> +							&opts);
>  		} else if (!strcmp(maps[i].name, "raw_map")) {
>  			bpf_file->map_fd[i] = build_raw_map(&maps[i], raw, numa_node);
>  		} else {
> -			bpf_file->map_fd[i] = bpf_create_map_node(
> +			LIBBPF_OPTS(bpf_map_create_opts, opts,
> +				.map_flags = maps[i].def.map_flags,
> +				.numa_node = numa_node,
> +			);
> +
> +			bpf_file->map_fd[i] = bpf_map_create(
>  							maps[i].def.type,
>  							maps[i].name,
>  							maps[i].def.key_size,
>  							maps[i].def.value_size,
>  							maps[i].def.max_entries,
> -							maps[i].def.map_flags,
> -							numa_node);
> +							&opts);
>  		}
>  
>  		if (bpf_file->map_fd[i] < 0) {
> -- 
> 2.30.2
